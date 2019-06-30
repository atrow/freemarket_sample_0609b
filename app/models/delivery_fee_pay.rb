class DeliveryFeePay < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    {id: 1, delivery_fee_pay: '送料込み（出品者負担）'},
    {id: 2, delivery_fee_pay: '着払い（購入者負担）'}
  ]
end
