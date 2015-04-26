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

# params
# {
#   "ToCountry"=>"US", 
#   "MediaContentType0"=>"image/jpeg", 
#   "ToState"=>"VA", 
#   "SmsMessageSid"=>"MMfe14300697df1a1b1e0ec603bfde5723", 
#   "NumMedia"=>"1", 
#   "ToCity"=>"VIENNA", 
#   "FromZip"=>"22209", 
#   "SmsSid"=>"MMfe14300697df1a1b1e0ec603bfde5723", 
#   "FromState"=>"VA", 
#   "SmsStatus"=>"received", 
#   "FromCity"=>"CENTREVILLE", 
#   "Body"=>"", 
#   "FromCountry"=>"US", 
#   "To"=>"+17033497371", 
#   "ToZip"=>"20186", 
#   "MessageSid"=>"MMfe14300697df1a1b1e0ec603bfde5723", 
#   "AccountSid"=>"AC619f789765e27b4af291c61d77952b80", 
#   "From"=>"+17038287113", 
#   "MediaUrl0"=>"https://api.twilio.com/2010-04-01/Accounts/AC619f789765e27b4af291c61d77952b80/Messages/MMfe14300697df1a1b1e0ec603bfde5723/Media/MEb8187fd0fb4206a56dfe7ed6f7d82fff", 
#   "ApiVersion"=>"2010-04-01", 
#   "controller"=>"twilio", 
#   "action"=>"process_sms"
# }


  def process_sms
    @to_number = params[:To].slice(2..-1)
    @from_number = params[:From].slice(2..-1)
    @user = User.find_by(phone_number: @from_number)
    @body = params[:Body]
    @image_url = params[:MediaUrl0]
    if @user
      @memorialized_user = @user.get_memorialized_user_by_twilio_number(@to_number)
      if @memorialized_user
        puts @memorialized_user.full_name
        @memory = Memory.create(content:@body, user_id:@user.id, memorialized_user_id:@memorialized_user.id, image_url:@image_url)
        puts @memory.content
        puts "*"*100
      end
    end
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts params
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts "^^^^^^^^^^^^^^^^^^^"
    # puts "^^^^^^^^^^^^^^^^^^^"

    # puts "-"*30
    # if @user
    #   puts "From User: #{@user.full_name}"
    #   puts "-"*5
    # end
    # puts 'to_number: '+ @to_number
    # puts "-"*5
    # puts 'from_number: '+ @from_number
    # puts "-"*5
    # puts 'body: '+ @body
    # puts "-"*30
    render 'process_sms.xml.erb', :content_type => 'text/xml'
  end

end
