class UserDetail < ApplicationRecord

  validates :zip_code,:prefecture_id, :city, :street, presence: true
  belongs_to :user
  belongs_to :prefecture, optional: true
end
