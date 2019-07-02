class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :product_pictures, dependent: :destroy
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
  accepts_nested_attributes_for :product_pictures
end
