# frozen_string_literal: true

# Create Students
class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false, default: ''
      t.date :birthday

      t.timestamps
    end
  end
end
