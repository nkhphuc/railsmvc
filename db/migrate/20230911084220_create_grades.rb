# frozen_string_literal: true

# Create Grades
class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.integer :subject
      t.integer :semester
      t.integer :score
      t.references :student, null: false, default: 0, foreign_key: true

      t.timestamps
    end
  end
end
