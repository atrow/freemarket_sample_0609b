class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :family_name_kana, :first_name, :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[\p{hiragana}\p{katakana}\p{blank}ー－]+\z/ }
  validates :family_name_kana,  format: { with: /\A[\p{hiragana}\p{katakana}\p{blank}ー－]+\z/ }

  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  has_many :products
  has_many :user_deriverys, dependent: :destroy
  has_many :purchases_of_seller, class_name: 'Purchase', foreign_key: 'seller_id'
  has_many :purchases_of_buyer, class_name: 'Purchase', foreign_key: 'buyer_id'
  has_many :products_of_seller, through: :purchases_of_seller, source: 'product'
  has_many :products_of_buyer, through: :purchases_of_buyer, source: 'product'
end
