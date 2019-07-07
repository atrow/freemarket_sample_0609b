class DeliveryOffDay < ActiveHash::Base
  include ActiveHash::Associations
  has_many :products
  self.data = [
    {id: 1, delivery_off_day: '1〜2日'},
    {id: 2, delivery_off_day: '2〜3日'},
    {id: 3, delivery_off_day: '4〜7日'}
  ]
end
