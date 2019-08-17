FactoryBot.define do
  factory :purchase do
    product
    buyer_id { nil }
    seller_id { nil }
  end
end
