require_relative '../../db/config'
require 'faker'

class Teacher < ActiveRecord::Base
  has_many :students

  validates :email, :uniqueness => true
  validates :email, :format => { :with => /.+@{1}.+\.+.{2}/, :message => "not correct email format"}
  # validates :age, :numericality => { :greater_than_or_equal_to => 5 }
  validate :validate_phone_num

  def name
    "#{self.first_name} #{self.last_name}"
  end

  # def age
  #   Time.now.year - self.birthday.year
  #   # ((Date.today - Date.parse(self.birthday))/365).to_i
  # end

  def validate_phone_num
    arr = self.phone.scan(/\d+/).to_a 
    if arr.reduce(:+).length < 10
      errors.add(:phone, "invalid phone number")
    end
  end

end

# Create 9 teachers, each with unique names and email addresses.
  9.times do
    Teacher.create :first_name => Faker::Name.first_name,
                   :last_name  => Faker::Name.last_name,
                   :email      => Faker::Internet.email,
                   :phone      => Faker::PhoneNumber.phone_number
  end
