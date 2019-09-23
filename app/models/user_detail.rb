class UserDetail < ApplicationRecord

  validates :zip_code, :city, :street,:prefecture_id, presence: true

  belongs_to :user
  belongs_to :prefecture, optional: true
end
