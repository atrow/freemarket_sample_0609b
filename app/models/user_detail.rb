class UserDetail < ApplicationRecord

  validates :zip_code, :city, :street, presence: true

  belongs_to :user
  belongs_to :prefecture, optional: true
end
