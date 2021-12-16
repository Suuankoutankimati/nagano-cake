class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
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

  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end
end
