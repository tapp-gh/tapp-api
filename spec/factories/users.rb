FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    name { Faker::Name.unique.name }
    date_of_birth { Faker::Date.birthday(min_age: 18) }
    password {"password"}
    is_active { true }
  end
end
