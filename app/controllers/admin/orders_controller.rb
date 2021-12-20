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
    @order = Order.find(params[:id])
    @ordered = OrderDetail.where(id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @ordered = @order.order_details
    @order.update(order_params)
    if @order.status == "confirm"
      @ordered.each do |ordered|
         #binding.pry
        ordered.update(making_status: "wait")
      end
    end
    redirect_to admin_order_path(@order)
  end

  

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
