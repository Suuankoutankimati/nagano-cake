class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    # カートアイテムの小計を足したもの
    @total = @cart_items.inject(0) { |sum,item| sum + item.subtotal }
    
  end
  
  def create
    # newアクションと同様の意味 慣習的に関連するモデルを生成するときに使用
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_items = current_customer.cart_items.all
    # 商品ごとにまとめて表示する方法
    if CartItem.find_by(item_id: @cart_item.item_id)
      @update_cart_item = CartItem.find_by(item_id: @cart_item.item_id)
      # 追加の数量をカートに入っている数量に足す
      @cart_item.amount += @update_cart_item.amount
      @update_cart_item.destroy
    end
   
    if @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to back
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    # 数量を更新する
    @cart_item.update(amount: params[:cart_item][:amount])
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
    
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end
end
