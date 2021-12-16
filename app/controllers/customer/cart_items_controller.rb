class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
  end
  
  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_items = current_customer.cart_items.all
    if CartItem.find_by(item_id: @cart_item.item_id)
      @update_cart_item = CartItem.find_by(item_id: @cart_item.item_id)
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
