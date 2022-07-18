class Admin::ItemsController < ApplicationController

  def new
    @item= Item.new
  end

  def create
    @item = Item.new(admin_item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  private

  def admin_item_params
    params.require(:item).permit(:name, :image, :description, :price, :is_active)
  end

end
