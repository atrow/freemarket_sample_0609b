FactoryBot.define do
  factory :user_detail do
      association :user
      zip_code           {"2222222"}
      city               {Faker::Address.city}
      street             {Faker::Address.street_address}
      building_name      { nil }
      prefecture_id      {Prefecture.all.sample.id}
      phone              {Faker::PhoneNumber.phone_number}
  end
 end
