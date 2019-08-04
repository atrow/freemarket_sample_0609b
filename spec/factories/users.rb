FactoryBot.define do
  password = Faker::Internet.password(8)

  factory :user do
    nickname              {Faker::Games::Pokemon.name}
    family_name           {Faker::Name.last_name}
    family_name_kana      {"bob"}
    first_name            {Faker::Name.first_name}
    first_name_kana       {"bob"}
    email                 {Faker::Internet.email}
    password              {password}
    password_confirmation {password}
  end
end
