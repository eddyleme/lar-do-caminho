# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class AdminMailerPreview < ActionMailer::Preview
  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  # def password_reset
  #   AdminMailer.password_reset
  # end

    def password_reset
    admin = Admin.first
    admin.reset_token = Admin.new_token
    AdminMailer.password_reset(admin)
  end
end
