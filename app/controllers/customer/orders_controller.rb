class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end
end
