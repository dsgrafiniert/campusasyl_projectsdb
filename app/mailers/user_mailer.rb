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
    
end
