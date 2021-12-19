class Admin::OrdersController < ApplicationController

  def index
    @count = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count

    # 雷
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
  end

  def show
    #アソシエーションでcustomerの情報が入ってるよね？入ってる
    @order = Order.find(params[:id])
    #これいらないよね？
    #@customer = Customer.find(params[:id])
    @ordered = OrderDetail.where(id: @order.id)

    #@ordered_items = @order.items
  end

  def update
    order = Order.find(params[:id])
    status = params[:order][:status].to_i
    order.update(status: status)
    redirect_to admin_order_path(order)
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
