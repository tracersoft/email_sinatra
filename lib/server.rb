require 'sinatra'
require_relative "./send_email"

post '/mailer' do
  @name = params[:name]
  @email = params[:email]
  @subject = params[:subject]
  @message = params[:message]
  SendEmail.new(@name, @email,@subject, @message).send 
end




