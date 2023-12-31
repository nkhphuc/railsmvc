# == Schema Information
#
# Table name: teachers
#
#  id         :bigint           not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :bigint           not null
#
# Indexes
#
#  index_teachers_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
class Teacher < ApplicationRecord
    belongs_to :school

    has_many :student_classes, dependent: :destroy

    validates :name, presence: true

    def self.ransackable_attributes(auth_object = nil)
      ["name", "school_id"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["school"]
    end
end
