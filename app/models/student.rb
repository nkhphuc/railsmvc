# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  email      :string(255)      default(""), not null
#  image      :string(255)
#  medias     :text(65535)
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Student
class Student < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploaders :medias, MediaUploader
  serialize :medias, JSON

  has_many :grades, dependent: :destroy
  accepts_nested_attributes_for :grades, reject_if: :all_blank, allow_destroy: true
end
