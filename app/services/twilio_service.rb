# app/services/twilio_service.rb (create this file)
class TwilioService
  def self.send_sms(to, body)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'], # Your Twilio phone number
      to: to,
      body: body
    )
  end
end
	