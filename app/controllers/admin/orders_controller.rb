class Admin::OrdersController < ApplicationController
  def show
   @order = Order.where(id: params[:id])
  end
  
  private
    def order_params
      params.require(:order).permit(:order_status)
    end
end
