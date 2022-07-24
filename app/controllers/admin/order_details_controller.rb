class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order = order_detail.order
    order_details = order.order_details
    
    flash[:notice] = "製作ステータスが更新されました"
    redirect_to admin_order_path(order)
  end
  
  private
  
    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end
    
end
