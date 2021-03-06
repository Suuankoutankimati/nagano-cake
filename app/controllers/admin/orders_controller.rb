class Admin::OrdersController < ApplicationController
  layout 'admin.html.erb'
  before_action :authenticate_admin!
  # before_action :if_not_admin
  def index
    @count = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count

    # ダイレクト先によるpathの取得の条件分岐
    
    # before_uri = URI.parse(request.referer)
    # @path = Rails.application.routes.recognize_path(before_uri.path)
    # if @path[:action] == "top"
    #   @orders = Order.page(params[:page]).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    # elsif @path[:action] == "show"
    #   @customer = Customer.find(@path[:id])
    #   @orders = @customer.orders.page(params[:page])
    # else
    #   @orders = Order.page(params[:page])
    # end

    @orders = Order.page(params[:page]).reverse_order
    @ordered = OrderDetail.where(params[:id])
  end

  def show
    @order = Order.find(params[:id])
    @ordered = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @ordered = @order.order_details
    #注文ステータス製造ステータスの連動　enum（１→２）
    @order.update(order_params)
    if @order.status == "confirm"
      @ordered.each do |ordered|
        ordered.update(making_status: "wait")
      end
    end
    redirect_to admin_order_path(@order)
  end



  private

  def order_params
    params.require(:order).permit(:status)
  end


  # def if_not_admin
  #   redirect_to new_admin_session_path unless admin_signed_in?
  # end
end
