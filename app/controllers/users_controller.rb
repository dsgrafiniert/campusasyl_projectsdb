class UsersController < ApplicationController
  include ActsAsTaggableOn::TagsHelper

  before_action :authenticate_user!

  def index
    @users = policy_scope(User.all)
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if params[:user].has_key?(:new_skill) && params[:user][:new_skill] != nil && params[:user][:new_skill] != ""
      params[:user][:skill_list] << params[:user][:new_skill]
    end

    if params[:user].has_key?(:new_language_skill) && params[:user][:new_language_skill] != nil && params[:user][:new_language_skill] != ""
      params[:user][:language_skill_list] << params[:user][:new_language_skill]
    end

    if params[:user].has_key?(:new_working_experience) && params[:user][:new_working_experience] != nil && params[:user][:new_working_experience] != ""
      params[:user][:working_experience_list] << params[:user][:new_working_experience]
    end

    if params[:user].has_key?(:new_study) && params[:user][:new_study] != nil && params[:user][:new_study] != ""
      params[:user][:study_list] << params[:user][:new_study]
    end

    if @user.update(secure_params)
      redirect_to user_path(@user), :notice => "User updated."
    else
      redirect_to user_path(@user), :alert => "Unable to update user."+@user.errors.messages.inspect
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role, { skill_list: [], study_list:[], working_experience_list:[], language_skill_list:[] }, :new_language_skill, :new_working_experience, :new_study, :new_skill, :telephone, :email, :name)
  end

end
