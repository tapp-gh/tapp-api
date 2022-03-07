FactoryBot.define do
  factory :user do
    email { "tapp@gmail.com" }
    name { "Tapp Api" }
    date_of_birth { "18/02/2022" }
    password {"password"}
  end
end
