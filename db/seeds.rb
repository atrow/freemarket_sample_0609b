# coding: utf-8
require "csv"

CSV.foreach('db/region.csv') do |row|
  Region.create!(region: row[0])
end

ProductStatus.create!(
  [
    {product_status: '販売中'},
    {product_status: '売り切れ'},
    {product_status: '出品削除'},
    {product_status: '取引中'}
  ]
)

Condition.create!(
  [
    {condition: '新品・未使用'},
    {condition: '未使用に近い'},
    {condition: '目立った傷汚れなし'},
    {condition: 'やや傷や汚れ'},
    {condition: '傷や汚れあり'},
    {condition: '全体的に状態が悪い'}
  ]
)

DeliveryFeePay.create!(
  [
    {delivery_fee_pay: '送料込み（出品者負担）'},
    {delivery_fee_pay: '着払い（購入者負担）'}
  ]
)

DeliveryWay.create!(
  [
    {delivery_way: 'らくらくメルカリ便'},
    {delivery_way: 'ゆうゆうメルカリ便'},
    {delivery_way: '大型らくらくメルカリ便'},
    {delivery_way: '未定'},
    {delivery_way: 'ゆうメール'},
    {delivery_way: 'レターパック'},
    {delivery_way: '普通郵便（定形・定形外）'},
    {delivery_way: 'クロネコヤマト'},
    {delivery_way: 'ゆうパック'},
    {delivery_way: 'クリックポスト'},
    {delivery_way: 'ゆうパケット'}
  ]
)

DeliveryOffDay.create!(
  [
    {delivery_off_day: '1〜2日'},
    {delivery_off_day: '2〜3日'},
    {delivery_off_day: '4〜7日'}
  ]
)

SizeType.create!(
  [
    {size_type: '大人服'},
    {size_type: '子供服'},
    {size_type: '大人靴'},
    {size_type: '子供靴'}
  ]
)

CSV.foreach('db/size.csv') do |row|
  Size.create!(size: row[0], size_type_id: row[1])
end

CSV.foreach('db/category.csv') do |row|
  Category.create!(category: row[0], size_types_id: row[1], parent_id: row[2])
end
