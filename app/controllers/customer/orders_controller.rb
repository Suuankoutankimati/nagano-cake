class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
  # sort機能のヘルパーメソッド
  # ソートキーと順序の方向（asc/desc）
  helper_method :sort_column, :sort_direction

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
    @cart_items = current_customer.cart_items.all
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
    #カート商品を注文詳細へ保存
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save
    end
    #注文後にカート内の商品を削除
    @cart_items.destroy_all
    redirect_to completion_orders_path
  end

  def completion
  end

  def index
    @genres = Genre.all
    @orders = current_customer.orders.order("#{sort_column} #{sort_direction}")
  end

  # 順序の方向(asc(昇順)/desc(降順))の選択
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  # ソートキー(データをソートする時の順序の基準)
  def sort_column
    Order.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order_details.inject(0) { |sum, item| sum + item.subtotal }
    @genres = Genre.all
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :total_price, :status)
  end

  # def order_details
  #   params.require(:order_details).permit(:order_id, :item_id, :price, :amount, :making_status)
  # end
end
