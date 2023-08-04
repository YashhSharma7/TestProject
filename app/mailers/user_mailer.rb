class UserMailer < ApplicationMailer
   #	def new_account_notification(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Welcome to Our Website!') # Email subject
  # end
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Our Website!')
  end
end
