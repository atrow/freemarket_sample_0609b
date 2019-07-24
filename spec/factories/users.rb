FactoryBot.define do
  factory :user do
    nickname              {"bob"}
    family_name           {"bob"}
    family_name_kana      {"bob"}
    first_name            {"bob"}
    first_name_kana       {"bob"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end
end