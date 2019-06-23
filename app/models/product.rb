class Product < ApplicationRecord
  belongs_to :condition
  belongs_to :delivery_fee_pay
  belongs_to :region
  belongs_to :delivery_off_day
  belongs_to :category
  belongs_to :brand
  belongs_to :product_status
  has_many :product_pictures, dependent: :destroy
  has_one :purchases
end
