class Purchase < ApplicationRecord
  belongs_to :seller_user, class_name: 'User'
  belongs_to :buyer_user, class_name: 'User'
  belongs_to :product
end
