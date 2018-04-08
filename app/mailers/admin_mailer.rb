class AdminMailer < ApplicationMailer
  default :from => "lartesteremail@gmail.com"

  def welcome_email(admin)
    @admin = admin
    mail(:to => admin.email, :subject => "Welcome to My Awesome Site")
  end

  def password_reset(admin)
    @admin = admin
    mail(to: admin.email, subject: "Password reset")
  end
end
