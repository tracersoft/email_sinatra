require 'pony'
require File.expand_path("lib/validate")

class SendEmail
  attr_reader :email

  def initialize(name, email, subject, message) 
    @name = name
    @email = email
    @subject = subject
    @message = message
  end

  def send
    if Validate.not_null?(self) && Validate.email_valid?(self.email)
      Pony.mail({
        :to => ENV['user_name'],
        :from => ENV['user_name'], 
        :subject => @subject,
        :body => formated_message,
        :via => :smtp,
        :via_options => {
          :address              => ENV['smtp'],
          :port                 => ENV['smtp_port'],
          :enable_starttls_auto => true,
          :user_name            => ENV['user_name'], #'joaomarcelo.consultor@gmail.com',
          :password             => ENV['password'],
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => ENV['domain'] # the HELO domain provided by the client to the server
        }
      })    
    end
  end

  def formated_message
    "Nome: #{@name} \n Email: #{@email}\n\n Mensagem: #{@message}"
  end

end


