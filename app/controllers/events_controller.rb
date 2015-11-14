class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @events = policy_scope(Event.all)
  end

  def show
    authorize @event, :show?
  end

  def new
    @event = Event.new(:project => Project.find(params[:project_id]))
    authorize @event, :new?
  end

  def edit
    authorize @event, :edit?
  end

  def create
    @event = Event.new(event_params)
    authorize @event, :create?

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

  def update
    authorize @event, :update?

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

  def destroy
    authorize @event, :destroy?
    project = @event.project

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
