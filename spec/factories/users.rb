FactoryBot.define do
  Faker::Config.locale = :ja
  password = Faker::Internet.password(min_length: 8)

  factory :user do
    nickname              {Faker::Name.initials}
    family_name           {Faker::Name.last_name}
    family_name_kana      {"アリス"}
    first_name            {Faker::Name.first_name}
    first_name_kana       {"ボブ"}
    email                 {Faker::Internet.email}
    password              {password}
    password_confirmation {password}
  end
  user_detail = FactoryBot.create(:user_detail)
end
