class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orders = UserOrders.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orders = UserOrders.new(orders_params)
    if @orders.valid?
      pay_item
      @orders.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def orders_params
    params.permit(:token, :item_id, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, price: @item.price) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: orders_params[:price],
      card: orders_params[:token],
      currency:'jpy'
    )
  end
end
