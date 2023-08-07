class RegistrationsController < Devise::RegistrationsController

	def create
    super do |user|
      SendEmailsJob.perform_later(user) if user.persisted?
      
      #TwilioService.send_sms('+917987781031', 'Hiii ')
      
    end
  end
 
end
