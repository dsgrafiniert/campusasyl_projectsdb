class Users::RegistrationsController < Devise::RegistrationsController
  
  def create
      begin
        super
      rescue ActiveRecord::RecordNotUnique
        user = User.find_by_email(params[:user][:email])
        if user.present? && user.valid_password?(params[:user][:password])
          # The credentials are valid for the existing user. We can
          # sign them in.
          sign_in(:user, user)
          respond_with user, :location => after_sign_in_path_for(user)
        else
          # The credentials are invalid.
          # This should only happen if multiple users register with the
          # same email at the same time. Now we can simply attempt to
          # register the user again, knowing it will fail, in order to
          # generate the appropriate error messages.
          
          redirect_to "/users/sign_up", notice: 'There is already an account for this mail adress.'
        end
      end        
    end
  
  def edit
    @allstudies = Tagging.where(:context => "study").joins(:tag).select('DISTINCT tags.name').map{ |x| x.name}
    puts @allstudies
    super
  end
  
  protected

  def after_sign_up_path_for(resource)
    '/users/edit' # Or :prefix_to_your_route
  end
  
  
end