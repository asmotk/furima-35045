class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :go_toppage, only: :index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  private

  def go_toppage
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
