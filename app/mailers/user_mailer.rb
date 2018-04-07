class UserMailer < ApplicationMailer
  default :from => "from@example.com"

  def welcome_email(admin)
    @admin = admin
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
