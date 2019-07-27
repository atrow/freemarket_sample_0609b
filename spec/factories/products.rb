FactoryBot.define do
  factory :product do
    name {"TestProduct"}
    description {"this is a test"}
    price {10000}
    condition_id {Condition.all.sample.id}
    brand_id {FactoryBot.create(:brand).id}
    delivery_fee_pay_id {DeliveryFeePay.all.sample.id}
    delivery_off_area_id {Prefecture.all.sample.id}
    delivery_off_day_id {DeliveryOffDay.all.sample.id}
    delivery_way_id {DeliveryWay.all.sample.id}
    product_status_id {ProductStatus.all.sample.id}
    category_id {FactoryBot.create(:brand).category_id}
  end
end
