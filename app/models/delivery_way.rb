class DeliveryWay < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    {id: 1, delivery_way: 'らくらくメルカリ便'},
    {id: 2, delivery_way: 'ゆうゆうメルカリ便'},
    {id: 3, delivery_way: '大型らくらくメルカリ便'},
    {id: 4, delivery_way: '未定'},
    {id: 5, delivery_way: 'ゆうメール'},
    {id: 6, delivery_way: 'レターパック'},
    {id: 7, delivery_way: '普通郵便（定形・定形外）'},
    {id: 8, delivery_way: 'クロネコヤマト'},
    {id: 9, delivery_way: 'ゆうパック'},
    {id: 10, delivery_way: 'クリックポスト'},
    {id: 11, delivery_way: 'ゆうパケット'}
  ]
end
