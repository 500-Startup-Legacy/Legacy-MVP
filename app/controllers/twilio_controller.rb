class TwilioController < ApplicationController

  def process_sms
    to_number = params[:To]
    from_number = params[:From]
    body = params[:Body]
    puts "-"*30
    puts 'to_number: '+ to_number
    puts "-"*5
    puts 'from_number: '+ from_number
    puts "-"*5
    puts 'body: '+ body
    puts "-"*5
    puts 'params:'
    puts params
    puts "-"*30
  end

end
