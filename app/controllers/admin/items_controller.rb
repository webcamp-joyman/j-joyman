class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(admin_item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(admin_item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def admin_item_params
    params.require(:item).permit(:name, :image, :description, :price, :is_active)
  end

end
