class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:items).permit(:item_name, :item_info, :item_category_id, :item_status_id, :shipping_fee_id, :prefecture_id, scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
