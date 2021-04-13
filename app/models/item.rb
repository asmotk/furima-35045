class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: {maximum: 40}
    validates :item_info, length: {maximum: 1000}
    validates :item_category_id, numericality: { other_than: 1 } 
    validates :item_status_id, numericality: { other_than: 1 } 
    validates :shipping_fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :scheduled_delivery_id, numericality: { other_than: 1 } 
    validates :price, format: {with: /\A[0-9]+\z/}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :user
  end
end
