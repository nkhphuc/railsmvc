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
FactoryBot.define do
    factory :student do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    end
  end
