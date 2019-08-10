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
  scope :get_category_products, -> (category_id) { where(category_id: category_id)}


  def self.get_id_range(categories)
    start_id = categories.first.id
    end_id = categories.last.id
    Range.new(categories.first.id, categories.last.id)
  end

  def self.get_ladies
    categories = Category.find(1).children
    ladies = get_category_products(get_id_range(categories))
  end

   def self.get_mens
     categories = Category.find(2).children
     ladies = get_category_products(get_id_range(categories))
   end

   def self.get_kids
     categories = Category.find(3).children
     ladies = get_category_products(get_id_range(categories))
   end

  #  def self.get_cosme
  #    categories = Category.find(7).children
  #    ladies = get_category_products(get_id_range(categories))

 end
