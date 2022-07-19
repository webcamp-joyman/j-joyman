class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item.member_id = current_user
  end

  def create
  end

  def destroy
  end

  def update
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
