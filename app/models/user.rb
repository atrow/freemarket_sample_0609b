class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :region
  has_many :products
  has_many :credit_cards
  has_many :purchaces
  has_many :user_deriverys
  has_many :sns_credentials
end
