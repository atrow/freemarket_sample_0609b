
FactoryBot.modify do
  factory :user_detail do
    association :user, factory: :user
    zip_code           {"1111111"}
    city               {Faker::Address.city}
    street             {Faker::Address.street_address}
    building_name      { nil }
    prefecture_id      {Prefecture.all.sample.id}
    phone              {Faker::PhoneNumber.phone_number}
  end
end
