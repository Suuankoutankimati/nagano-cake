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
    @customer = Customer.find(params[:id])
    @orderd_item = @order.order_details
    @ordered_items = @order.items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      @ordered_items.update(status: 1) if @order.status == 1
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
