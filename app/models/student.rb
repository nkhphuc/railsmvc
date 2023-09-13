# frozen_string_literal: true

# Student
class Student < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :grades, dependent: :destroy
  accepts_nested_attributes_for :grades, reject_if: :all_blank, allow_destroy: true
end
