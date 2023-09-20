FactoryBot.define do
    factory :student do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    end
  end
