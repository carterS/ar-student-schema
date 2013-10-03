require_relative '../../db/config'

class Student < ActiveRecord::Base
  belongs_to :teacher

  validates :email, :uniqueness => true
  validates :email, :format => { :with => /.+@{1}.+\.+.{2}/, :message => "not correct email format"}
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }
  validate :validate_phone_num

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    Time.now.year - self.birthday.year
    # ((Date.today - Date.parse(self.birthday))/365).to_i
  end

  def validate_phone_num
    arr = self.phone.scan(/\d+/).to_a 
    if arr.reduce(:+).length < 10
      errors.add(:phone, "invalid phone number")
    end
  end

  def self.distribute
    # access teacher_id
    self.all.each do |student|
      student.teacher_id = rand(1..9)
      student.save
    end

  end

# def self.find_out
#   p self.all.each do |x|
#     p x
#   end
# end

end

# Experimenting w/ function to validate phone num
# str = "407-774-9393"
# arr = str.scan(/\d+/).to_a 
# sum = arr.reduce(:+) 
# p sum.length
# is_valid if sum.length >= 10

#Student.distribute

t = Student.new
p t.methods.sort
