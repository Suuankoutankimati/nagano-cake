class Admin::OrderDetailsController < ApplicationController
  # before_action :if_not_admin
  before_action :authenticate_admin!
  def update

    @ordered = OrderDetail.find(params[:id])
    @order = @ordered.order
    @ordered.update(order_detail_params)
    #注文ステータス販売ステータスの連動  enum（１→２）
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
  
  # def if_not_admin
  #   redirect_to new_admin_session_path unless admin_signed_in?
  # end
end
