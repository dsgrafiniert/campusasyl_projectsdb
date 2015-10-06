class EventsController < ApplicationController
  
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:edit, :update, :destroy]
  
  # GET /cities
  # GET /cities.json
  def index
    @events = Event.all
    authorize Event
    
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    
  end

  # GET /cities/new
  def new
    @event = Event.new(:project => Project.find(params[:project_id]))
    authorize Event
    
  end

  # GET /cities/1/edit
  def edit
    authorize Event
    
  end

  # POST /cities
  # POST /cities.json
  def create
    @event = Event.new(event_params)

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
        format.html { redirect_to @event.project, notice: 'event was successfully updated.' }
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
    project=@event.project
    
    @event.destroy
    respond_to do |format|
      format.html { redirect_to project, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :project_id, :required_people, schedule_attributes: Schedulable::ScheduleSupport.param_names)
    end
  
end
