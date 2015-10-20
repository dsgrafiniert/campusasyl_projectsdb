class UsersController < ApplicationController
  include ActsAsTaggableOn::TagsHelper
  
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
  


  def update
    @user = User.find(params[:id])
    authorize @user
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
    params.require(:user).permit(:role, :skill_list, :study_list, :working_experience_list, :language_skill_list, :telephone, :email, :name)
  end

end
