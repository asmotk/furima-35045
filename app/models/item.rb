class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: {maximum: 40}
    validates :item_info, length: {maximum: 1000}
    validates :item_category_id
    validates :item_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price, format: {with: /\A[0-9]+\z/}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :user, foreign_key: true
  end
end
