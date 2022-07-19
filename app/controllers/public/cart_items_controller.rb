class CartItemsController < ApplicationController
  def index
    @cart_items = current_member.cart_items.all
    @total = 0
  end

  def create
    @cart_item = current_member.cart_items.new(cart_item_params)
    if current_member.cart_items.find_by(item_id: params[:cart_item][:item_id].present)
      cart_item = current_member.cart_items.find_by(item_id: params[:cart_item][:item_id])
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :member_id, :amount)
  end
end
