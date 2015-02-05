require File.expand_path("lib/validate")

describe Validate do
  
  it "#not_null?" do
    fake = Fake.new('joao', 'joao@example.com')        

    expect(Validate.not_null?(fake)).to be_truthy
  end

  it "#email_valid?" do
    email = 'joe@kamekamera.com'

    expect(Validate.email_valid?(email)).to be_truthy
  end

end

class Fake < Struct.new(:nome, :email)
  
end
