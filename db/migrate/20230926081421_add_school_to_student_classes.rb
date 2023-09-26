class AddSchoolToStudentClasses < ActiveRecord::Migration[7.0]
  def change
    add_reference :student_classes, :school, null: false, foreign_key: true
  end
end
