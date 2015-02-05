require 'valid_email/validate_email'

class Validate

  def self.not_null? obj
    !obj.instance_variables.map { |x| obj.instance_variable_get(x) }.any?(&:empty?)
  end
  
  def self.email_valid? email
    ValidateEmail.valid?(email)
  end

end
