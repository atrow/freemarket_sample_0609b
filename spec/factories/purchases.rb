FactoryBot.define do
  factory :purchase do
    product_id
    payment { Faker::Number.decimal }
    seller_id
  end
end
