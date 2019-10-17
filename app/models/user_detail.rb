class UserDetail < ApplicationRecord

  validates :zip_code,:prefecture_id, :city, :street, presence: true
  validates :zip_code,  format: {with: /\A\d{7}\z/}
  belongs_to :user
  belongs_to :prefecture, optional: true
end
