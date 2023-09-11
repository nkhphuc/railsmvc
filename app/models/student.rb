class Student < ApplicationRecord
  has_many :grades, dependent: :destroy
  accept_nested_attributes_for :grades
end
