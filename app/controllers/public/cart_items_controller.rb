class CartItemsController < ApplicationController
  def index
    @cart_items = current_member.cart_items
    @total = 0
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
