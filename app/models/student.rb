require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  
  def initialize(attributes = {})
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @gender = attributes[:gender]
    @birthday = attributes[:birthday]
    @email = attributes[:email]
    @phone = attributes[:phone]
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def age
    DateTime.now - DateTime.parse(@birthday)
  end
end

