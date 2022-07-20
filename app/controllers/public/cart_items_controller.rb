class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    unless member_signed_in?
      redirect_to items_path
    else
      @cart_items = current_member.cart_items.new(cart_item_params)
      if @cart_items.save
        redirect_to cart_items_path
      else
        redirect_to item_path(@cart_items.item_id)
      end
    end
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :member_id, :amount)
  end
end
