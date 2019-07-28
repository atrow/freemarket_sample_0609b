FactoryBot.define do
  factory :purchase do
    product
    seller_id { nil }
  end
end
