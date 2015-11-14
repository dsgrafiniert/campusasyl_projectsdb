class UserMailer < ApplicationMailer
  
  def invitation_email(user)
      @user = user
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
  def reminder_email(user, event_occurrence)
      @user = user
      @event = event_occurrence
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
  def participation_request_email(admin, user, project)
      @user = user
      @admin = admin
      @project = project
      @url  = 'http://example.com/login'
      mail(to: @admin.email, subject: 'Welcome to My Awesome Site')
  end
    
end
