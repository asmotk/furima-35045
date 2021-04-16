class Address < ApplicationRecord
  belongs_to :order
  belongs_to :prefecture

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :order
  end
end
