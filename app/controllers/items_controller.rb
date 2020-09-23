class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update]
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to show
    else
      render :new
    end
  end

private

  def item_params
    params.require(:item).permit(:image, :name, :price, :info, :category_id, :condition_id, :delivery_fee_id, :area_id, :date_of_shipment_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_item
     @item = Item.find(params[:id])
   end
end