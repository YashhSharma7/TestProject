class RegistrationsController < Devise::RegistrationsController
	def create
    super do |user|
      SendEmailsJob.perform_later(user) if user.persisted?
      
      #TwilioService.send_sms('+917987781031', 'Hiii ')
      
    end
  end
  # def create
  #   super do |user|
  #     if user.persisted?
  #       user.generate_and_store_otp
  #       UserMailer.welcome_email(user).deliver_now
  #     end
  #   end
  # end
end
