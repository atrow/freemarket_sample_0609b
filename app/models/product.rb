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
  has_one :purchase, dependent: :destroy
  delegate :seller, to: :purchase
  delegate :buyer, to: :purchase
  accepts_nested_attributes_for :purchase

  validates :price, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
  }
  validates :name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :delivery_fee_pay, presence: true
  validates :delivery_way, presence: true
  validates :delivery_off_area, presence: true
  validates :delivery_off_day, presence: true
  validates :category, presence: true

  scope :recent, -> { order(created_at: :desc).limit(4) }
  scope :get_category_products, -> (category_id) { where(category_id: category_id)}

  acts_as_paranoid

  def self.get_ladies
    categories = Category.where(parent_id: 14..32)
    ladies = get_category_products(categories)
  end

  def self.get_mens
    categories = Category.where(parent_id: 33..46)
    mens = get_category_products(categories)
  end

  def self.get_kids
    categories = Category.where(parent_id: 47..61)
    kids = get_category_products(categories)
  end

  def self.search(product_name)
    return Product.all unless product_name
    Product.where(['name LIKE ?', "%#{product_name}%"])
  end
end
