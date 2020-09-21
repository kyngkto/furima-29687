class ItemsController < ApplicationController

  before_action :set_item, only: [:edit,]
  #before_action :move_to_index, except: [:index, :new, :crate]
  def index
  end

  def new
    @item = Item.new
  end

  def crate
    @item = Item.new(item_params)
    @item = Item.new(image_params)
    @item.save
  end

  def edit
  end


private

  def item_params
    params.require(:item).permit(:image, :name, :price).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end
end