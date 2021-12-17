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
    
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orderd_item = @order.orderd_detail
  end
  
end
