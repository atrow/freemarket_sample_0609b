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
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  belongs_to :product_status
  has_one :purchase
  delegate :seller, to: :purchase
  delegate :buyer, to: :purchase
  accepts_nested_attributes_for :purchase

  validates :price, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
  }

  scope :recent, -> { order(created_at: :desc).limit(4) }
end
