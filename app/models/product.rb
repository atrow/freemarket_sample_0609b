class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :condition
  belongs_to :delivery_fee_pay
  belongs_to :delivery_way
  belongs_to :delivery_off_day
  belongs_to :delivery_off_area, class_name: 'Prefecture'
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :product_status
  has_one :purchase
  delegate :seller_user, to: :purchase
  delegate :buyer_user, to: :purchase
  accepts_nested_attributes_for :purchase

end
