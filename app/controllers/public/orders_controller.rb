class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
  cart_items = current_member.cart_items.all
  @order = current_member.orders.new(order_params)
  if @order.save
    cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart.item_id
      order_detail.amount = cart.amount
      order_detail.purchase_price = cart.item.price
      order_detail.save
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
  else
    @order = Order.new(order_params)
    render :new
  end
  end

  def confirmation
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:address_number] == "1"
      @order.address = current_member.address
      @order.post_code = current_member.post_code
      @order.name = current_member.last_name + current_member.first_name
    elsif params[:order][:address_number] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.post_code = @address.post_code
      @order.name = @address.name
    elsif params[:order][:address_number] == "3"
      address_new = current_member.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    end
    @cart_items = current_member.cart_items.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.item.price }
  end

  def complete
  end

  def index
    @order = Order.where(member_id: current_member.id)
    @item = OrderDetail
  end


  private

  def order_params
    params.require(:order).permit(:post_code, :address, :name, :postage, :bill, :method_payment )
  end

  def address_params
    params.require(:order).permit(:post_code, :name, :address )
  end
end
