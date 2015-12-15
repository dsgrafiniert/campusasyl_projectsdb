class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :participate, :approve, :decline, :find_participants, :invite, :accept_invite]
  before_action :authenticate_user!, only: [:participate]

  def index
    @projects = policy_scope(Project.all)
    @cities = City.all
    @categories = Category.where(category: nil)
  end

  def show
    authorize @project, :show?
  end

  def new
    @project = Project.new(:city => City.find(params[:city_id]))
    authorize @project, :new?
  end

  def edit
    authorize @project, :edit?
  end

  def create
    @project = Project.new(project_params)
    authorize @project, :create?
	if params[:project].has_key?(:new_skill) && params[:project][:new_skill] != nil && params[:project][:new_skill] != ""
      params[:project][:skill_list] << params[:project][:new_skill]
    end

    if params[:project].has_key?(:new_language_skill) && params[:project][:new_language_skill] != nil && params[:project][:new_language_skill] != ""
      params[:project][:language_skill_list] << params[:project][:new_language_skill]
    end

    if params[:project].has_key?(:new_working_experience) && params[:project][:new_working_experience] != nil && params[:project][:new_working_experience] != ""
      params[:project][:working_experience_list] << params[:project][:new_working_experience]
    end

    if params[:project].has_key?(:new_study) && params[:project][:new_study] != nil && params[:project][:new_study] != ""
      params[:project][:study_list] << params[:project][:new_study]
    end
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

  def update
    authorize @project, :update?
	if params[:project].has_key?(:new_skill) && params[:project][:new_skill] != nil && params[:project][:new_skill] != ""
      params[:project][:skill_list] << params[:project][:new_skill]
    end

    if params[:project].has_key?(:new_language_skill) && params[:project][:new_language_skill] != nil && params[:project][:new_language_skill] != ""
      params[:project][:language_skill_list] << params[:project][:new_language_skill]
    end

    if params[:project].has_key?(:new_working_experience) && params[:project][:new_working_experience] != nil && params[:project][:new_working_experience] != ""
      params[:project][:working_experience_list] << params[:project][:new_working_experience]
    end

    if params[:project].has_key?(:new_study) && params[:project][:new_study] != nil && params[:project][:new_study] != ""
      params[:project][:study_list] << params[:project][:new_study]
    end
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

  def destroy
    authorize @project, :destroy?

    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def participate
    authorize @project, :participate?

    @participation = Participation.where(:project => @project, :participant => current_user).first_or_create

    if @project.is_private
      @participation.status=:applied
      UserMailer.participation_request_email(current_user, @participant, @project).deliver
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
  
  def accept_invite
    authorize @project, :participate?

    @participation = Participation.where(:project => @project, :participant => User.find(params[:participant_id])).first_or_create

    @participation.status=:approved

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
    authorize @project, :find_participants?

    @users = CityParticipation.where(:city => @project.city).map{|e| e.participant}.flatten
    @users.delete_if{|user| user.projects.exists?(@project) || user == current_user}
    @users.sort{|a, b| b.common_tags(@project) <=> a.common_tags(@project)}
  end

  def approve
    authorize @project, :approve?

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
  
  def invite
    authorize @project, :invite?
    @participant = User.find(params[:participant_id])
    
    @participation = Participation.where(:project => @project, :participant => @participant).first_or_create
    @participation.generate_token
    @participation.status=:invited
    
    
    UserMailer.invitation_email(@participant, @project, current_user, "/#{I18n.locale}/projects/#{@project.id}/#{@participant.id}/accept/#{@participation.invitationHash}").deliver
    respond_to do |format|
      if @participation.save
        format.html { redirect_to "/#{I18n.locale}/projects/#{@project.id}/find_participants", notice: t('.participant_invited') }
      else
        format.html { redirect_to "/#{I18n.locale}/projects/#{@project.id}/find_participants", error: t('.something_went_wrong') }
      end
    end
  end
  
  

  def decline
    authorize @project, :decline?

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
      params.require(:project).permit(:title, :description, :city_id, :category_id, :time, { skill_list: [], study_list:[], working_experience_list:[], language_skill_list:[] }, :new_language_skill, :new_working_experience, :new_study, :new_skill, :urgent, :required_people, :is_private, :project_ids => [], :user_ids => [])
    end
end
