# == Schema Information
#
# Table name: teachers
#
#  id         :bigint           not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Teacher < ApplicationRecord
    has_many :student_classes, dependent: :destroy

    validates :name, presence: true
end
