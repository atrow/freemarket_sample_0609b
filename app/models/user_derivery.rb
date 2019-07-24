class UserDerivery < ApplicationRecord
  has_many :purchases
  belongs_to :user
  belongs_to :prefecture
end
