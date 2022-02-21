FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(name: name) }
    name { Faker::Name.name }
    date_of_birth { Faker::Date.birthday(min_age: 18) }
    is_active { true }
  end
end
