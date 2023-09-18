# frozen_string_literal: true

# == Schema Information
#
# Table name: grades
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  score      :integer
#  semester   :integer
#  subject    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           default(0), not null
#
# Indexes
#
#  index_grades_on_deleted_at  (deleted_at)
#  index_grades_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Grade < ApplicationRecord
  belongs_to :student

  enum subject: { 'Math' => 0, 'Physic' => 1 }
  enum semester: { 'I' => 0, 'II' => 1 }

  validates :score, inclusion: { in: 0..10 }
  acts_as_paranoid
end
