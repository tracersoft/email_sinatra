require 'rspec'
require 'pony'
require File.expand_path("lib/send_email")

describe SendEmail do
  before do
    ENV['user_name'] = 'john@doe.org'
    ENV['address'] = 'smtp.example.com'
    ENV['domain'] = 'localhost' 
    ENV['password'] = '123456'    
    ENV['smtp_port'] = '123'    
    ENV['smtp'] = 'smtp.example.com'    
  end

  it "#send" do
    expect(Pony).to receive(:mail).with({:to=>"john@doe.org", :from=>"john@doe.org", :subject=>"testando", :body=>"Nome: joao \n Email: jmfutrica@gmail.com\n\n Mensagem: esse é um teste ", :via=>:smtp, :via_options=>{:address=>"smtp.example.com", :port=>"123", :enable_starttls_auto=>true, :user_name=>"john@doe.org", :password=>"123456", :authentication=>:plain, :domain=>"localhost"}})
    mailer = SendEmail.new("joao", "jmfutrica@gmail.com", "testando", "esse é um teste " )
    mailer.send
  end

  it "#formated_message" do
    s = "Nome: joao \n Email: jmfutrica@gmail.com\n\n Mensagem: esse é um teste "
    form = SendEmail.new("joao", "jmfutrica@gmail.com", "testando", "esse é um teste " )
    
    expect(form.formated_message).to eq s 
  end
 
end
