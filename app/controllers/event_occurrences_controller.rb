class EventOccurrencesController < ApplicationController
  
  before_action :set_event_occurrence, only: [:show, :edit, :update, :destroy, :attend]
   before_action :authenticate_user!, only: [:edit, :update, :destroy, :attend]
   after_action :verify_authorized, only: [:edit, :update, :destroy, :attend]

   # GET /cities
   # GET /cities.json
   def index
     @events = EventOccurrence.all
     authorize EventOccurrence

   end

   # GET /cities/1
   # GET /cities/1.json
   def show

   end


   # GET /cities/1/edit
   def edit
     authorize EventOccurrence

   end
   
   def attend
     authorize @event
     if @event.attends.count < @event.event.required_people
     @attend = @event.attends.build(:user => current_user)
     if (! @event.event.event_occurrences.map{|occ| occ.users}.flatten.include?(current_user))
       @attend.status = :newbie
     else 
       @attend.status = :regular
     end

      respond_to do |format|
        if @attend.save
          format.html { redirect_to @event, notice: 'You have been added.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @attend.errors, status: :unprocessable_entity }
        end
      end
    else 
      respond_to do |format|
          format.html { redirect_to @event, notice: 'This event is already full. Thanks for your help, do you have time at any other date?.' }
          format.json { render :show, status: :error, location: @event }
        
      end
      end
   end

   # POST /cities
   # POST /cities.json
   def create
     @event = EventOccurrence.new(event_occurrence_params)

     respond_to do |format|
       if @event.save
         format.html { redirect_to @event.project, notice: 'Event was successfully created.' }
         format.json { render :show, status: :created, location: @event }
       else
         format.html { render :new }
         format.json { render json: @event.errors, status: :unprocessable_entity }
       end
     end
   end

   # PATCH/PUT /cities/1
   # PATCH/PUT /cities/1.json
   def update
     authorize @event

     respond_to do |format|
       if @event.update(event_params)
         format.html { redirect_to @event, notice: 'event was successfully updated.' }
         format.json { render :show, status: :ok, location: @event }
       else
         format.html { render :edit }
         format.json { render json: @event.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /cities/1
   # DELETE /cities/1.json
   def destroy
     authorize @event
     project=@event.event.project

     @event.destroy
     respond_to do |format|
       format.html { redirect_to project, notice: 'Event was successfully destroyed.' }
       format.json { head :no_content }
     end
   end

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_event_occurrence
       @event = EventOccurrence.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def event_params
       params.require(:event_occurrence).permit(:date, :event_id)
     end
  
  
end
