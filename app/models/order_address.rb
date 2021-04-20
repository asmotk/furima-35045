class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_number, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :address_number
    validates :phone_number, length: {maximum: 11}, format: {with: /\A[0-9]+\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_number: address_number, building: building, phone_number: phone_number, order_id: order.id)
  end

end