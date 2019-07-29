class TwilioClient
  def initialize
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = ENV['TWILIO_PHONE_NUMBER']
  end 
   
  def send_sms(options = {})
    puts options
    @client.messages.create(options.merge!(from: @from))
  end
end