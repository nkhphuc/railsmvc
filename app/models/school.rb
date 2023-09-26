# == Schema Information
#
# Table name: schools
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class School < ApplicationRecord
    has_many :teachers, dependent: :destroy
    has_many :student_classes, dependent: :destroy
end
