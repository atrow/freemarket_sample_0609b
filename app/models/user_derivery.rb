class UserDerivery < ApplicationRecord
  has_many :purchases
  belongs_to :user
  belongs_to :region
end
