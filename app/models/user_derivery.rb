class UserDerivery < ApplicationRecord
  has_many :perchases
  belongs_to :user
  belongs_to :region
end
