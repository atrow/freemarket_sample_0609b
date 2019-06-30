class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :region, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :user_deriverys, dependent: :destroy
  has_many :user_details, dependent: :destroy
  has_many :purchases_of_seller, class_name: 'Purchase', foreign_key: 'seller_id'
  has_many :purchases_of_buyer, class_name: 'Purchase', foreign_key: 'buyer_id'
  has_many :products_of_seller, through: :products_of_seller, source: 'product'
  has_many :products_of_buyer, through: :products_of_buyer, source: 'product'
end
