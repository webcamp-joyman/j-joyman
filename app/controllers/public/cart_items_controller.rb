class CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.find()
  end
  
  def create
  end
  
  def destroy
  end
  
  def update
  end
end
