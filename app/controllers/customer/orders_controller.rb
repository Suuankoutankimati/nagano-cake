class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    #カートアイテムの確認
    @cart_items = current_customer.cart_items.all
    # 合計金額(商品のみ)の算出
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order = Order.new(order_params)
    # address_numberの値が"1"のとき
    if params[:order][:address_number] == "1"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    # address_numberの値が"2"のとき
    elsif params[:order][:address_number] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    # address_numberの値が"3"のとき
    elsif params[:order][:address_number] == "3"
      @order.post_code = params[:order][:post_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to completion_orders_path
  end

  def completion
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    #@order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :total_price)
  end
end
