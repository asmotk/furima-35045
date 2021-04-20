class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :go_toppage, only: [:index, :create]

  def index
    set_item
    @order_address = OrderAddress.new
  end

  def create
      set_item
      @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def go_toppage
    set_item
    if current_user.id == @item.user_id && @item.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end