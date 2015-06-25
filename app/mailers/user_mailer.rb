class UserMailer < ApplicationMailer
default from: "from@example.com"
  layout 'mailer'

def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    #mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    mail(to: "kazuhiro.shimizu@gmail.com", subject: 'Welcome to My Awesome Site')
  end


end
