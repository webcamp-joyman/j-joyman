class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order = order_detail.order
    order_details = order.order_details
    order_details.each do |order_detail|
      if order_detail.making_status == "製作中"
        order.status = "製作中"
        order.save
      end
    end
    
    var = 0
    order_details.each do |order_detail|
      if order_detail.making_status == "製作完了"
        var += 1
      end
    end
    if var == order_details.count
      order.status = "発送準備中"
      order.save
    end
      
    
    flash[:notice] = "製作ステータスが更新されました"
    redirect_to request.referer
  end
  
  private
  
    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end
    
end
