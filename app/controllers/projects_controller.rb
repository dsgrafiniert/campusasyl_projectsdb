class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :participate, :approve, :decline, :find_participants]
  before_action :authenticate_user!, only: [:participate]

  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @cities = City.all
    @categories = Category.where(:category => nil)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    authorize @project
    
  end

  # GET /projects/new
  def new
    @project = Project.new(:city => City.find(params[:city_id]))
  end

  # GET /projects/1/edit
  def edit
    authorize @project
    
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    authorize @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def participate
      @participation = Participation.where(:project => @project, :user => current_user).first_or_create
      if (@project.is_private)
        @participation.status=:applied
      else
        @participation.status=:approved
      end
       respond_to do |format|
          if @participation.save
            format.html { redirect_to @project, notice: 'Successfully applied.' }
            format.json { render :show, status: :created, location: @project }
          else
            format.html { render :new }
            format.json { render json: @project.errors, status: :unprocessable_entity }
          end
        end
    
  end
  
  def find_participants
    @users = CityParticipation.where(:city => @project.city).map{|e| e.participant}.flatten
    @users.sort{|a, b| b.common_tags(@project) <=> a.common_tags(@project)}
  end
  
  def approve
    participation = Participation.find(params[:participant_id])
    respond_to do |format|
    
    if participation.update(:status => :approved)
      format.html { redirect_to @project, notice: 'Participant was successfully approved.' }
      format.json { render :show, status: :ok, location: @project }
    else
      format.html { render :edit }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end
  end
  
  def decline
    participation = Participation.find(params[:participant_id])
    participation.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Participant was successfully declined.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :city_id, :category_id, :time, { skill_list: [], study_list:[], working_experience_list:[], language_skill_list:[] }, :new_language_skill, :new_working_experience, :new_study, :new_skill, :urgent, :required_people, :is_private, :user_ids => [])
    end
end
