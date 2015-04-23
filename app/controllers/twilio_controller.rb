class TwilioController < ApplicationController
  #to enable Twilio to make POST requests, 
  #c.f. https://www.twilio.com/blog/2014/02/twilio-on-rails-integrating-twilio-with-your-rails-4-app.html
  skip_before_action :verify_authenticity_token 
  # Parameters: 
  #   {
  #   "ToCountry"=>"US", 
  #   "ToState"=>"DC", 
  #   "SmsMessageSid"=>"SMd127fb50c39e4ae855d9d79ae1916fb2", 
  #   "NumMedia"=>"0", 
  #   "ToCity"=>"WASHINGTON", 
  #   "FromZip"=>"22209", 
  #   "SmsSid"=>"SMd127fb50c39e4ae855d9d79ae1916fb2", 
  #   "FromState"=>"VA", 
  #   "SmsStatus"=>"received", 
  #   "FromCity"=>"CENTREVILLE", 
  #   "Body"=>"Test number 3", 
  #   "FromCountry"=>"US", 
  #   "To"=>"+12023910271", 
  #   "ToZip"=>"20006", 
  #   "MessageSid"=>"SMd127fb50c39e4ae855d9d79ae1916fb2", 
  #   "AccountSid"=>"AC619f789765e27b4af291c61d77952b80", 
  #   "From"=>"+17038287113", 
  #   "ApiVersion"=>"2010-04-01"
  # }

  def process_sms
    @to_number = params[:To].slice(2..-1)
    @from_number = params[:From].slice(2..-1)
    @user = User.find_by(phone_number: from_number)
    @body = params[:Body]
    puts "-"*30
    if user
      puts "From User: #{user.full_name}"
      puts "-"*5
    end
    puts 'to_number: '+ to_number
    puts "-"*5
    puts 'from_number: '+ from_number
    puts "-"*5
    puts 'body: '+ body
    puts "-"*30
    render 'process_sms.xml.erb', :content_type => 'text/xml'
  end

end
