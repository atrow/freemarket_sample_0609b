class ProductStatus < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    {id: 1, product_status: '販売中'},
    {id: 2, product_status: '売り切れ'},
    {id: 3, product_status: '出品削除'},
    {id: 4, product_status: '取引中'}
  ]
end
