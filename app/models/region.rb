class Region < ApplicationRecord
  has_many :products
  has_many :user_deliverys
  has_many :products
end
