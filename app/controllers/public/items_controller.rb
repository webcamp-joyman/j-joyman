class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(10)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def genre_search
    @genres = Genre.all
    @genre_searched = Genre.find(params[:id])
    @all_items_searched = Item.where(genre_id: @genre_searched.id)
    @items = @all_items_searched.page(params[:page]).per(8).reverse_order
  end

end
