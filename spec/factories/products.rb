FactoryBot.define do
  factory :product do
    brand = FactoryBot.create(:brand)
    name {"TestProduct"}
    description {"this is a test"}
    price {10000}
    condition_id {FactoryBot.create(:condition).id}
    brand_id {brand.id}
    delivery_fee_pay_id {FactoryBot.create(:delivery_fee_pay).id}
    delivery_off_area_id {FactoryBot.create(:region).id}
    delivery_off_day_id {FactoryBot.create(:delivery_off_day).id}
    product_status_id {FactoryBot.create(:product_status).id}
    category_id {brand.category_id}
  end
end
