FactoryBot.define do

  factory :user_detail do
    association :user, factory: :user
    zip_code           {"1111111"}
    city               {Faker::Address.city}
    street             {Faker::Address.street_address}
    building_name      {"null"}
    prefecture_id      {Faker::Number.within(range: 1..47)}
    phone              {Faker::PhoneNumber.phone_number}
  end
end
