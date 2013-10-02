require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |field|
      field.string :first_name
      field.string :last_name
      field.string :gender
      field.date :birthday
      field.string :email
      field.string :phone

      field.timestamps
    end
  end
end
