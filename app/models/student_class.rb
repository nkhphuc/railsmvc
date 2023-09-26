# == Schema Information
#
# Table name: student_classes
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :bigint           not null
#  teacher_id :bigint           not null
#
# Indexes
#
#  index_student_classes_on_school_id   (school_id)
#  index_student_classes_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#  fk_rails_...  (teacher_id => teachers.id)
#
class StudentClass < ApplicationRecord
  belongs_to :teacher
  belongs_to :school
end
