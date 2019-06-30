class Region < ApplicationRecord
  has_many :user_deliverys
  has_many :products
end
