class Admin::OrderDetailsController < ApplicationController

  def update

    @ordered = OrderDetail.find(params[:id])
    @order = @ordered.order
    @ordered.update(order_detail_params)
    #binding.pry
    if @ordered.making_status == "production"
      @order.update(status: "production")
    elsif @ordered.making_status == "completion"
      @order.update(status: "preparation")
    end
   redirect_to admin_order_path(@order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
