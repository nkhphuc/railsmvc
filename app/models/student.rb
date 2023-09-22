# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  deleted_at :datetime
#  email      :string(255)      default(""), not null
#  first_name :string(255)
#  image      :string(255)
#  medias     :text(65535)
#  name       :string(255)      default(""), not null
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_students_on_deleted_at  (deleted_at)
#
class Student < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploaders :medias, MediaUploader
  serialize :medias, JSON

  has_many :grades, dependent: :destroy
  accepts_nested_attributes_for :grades, reject_if: :all_blank, allow_destroy: true
  acts_as_paranoid

  def full_name
    "#{first_name} #{name}"
  end

  after_create :log_creation

  def self.send_birthday_emails
    today = Date.today
    students_with_birthday = where("extract(month from birthday) = ? AND extract(day from birthday) = ?", today.month, today.day)

    students_with_birthday.each do |student|
      BirthdayEmailWorker.perform_async(student.id)
    end
  end

  after_create :set_order

  def self.ransackable_attributes(auth_object = nil)
    ["birthday", "email", "first_name", "name", "full_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["grades"]
  end

  ransacker :full_name do |parent|
    Arel::Nodes::NamedFunction.new('CONCAT_WS', [
      Arel::Nodes.build_quoted(' '), parent.table[:first_name], parent.table[:name]
    ])
  end

  private

  def log_creation
    Rails.logger.info("New student created: #{self.inspect}")
  end

  def set_order
    self.order = id
  end
end
