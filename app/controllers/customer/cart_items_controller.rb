class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
      @genres = Genre.all
      @item = Item.find_by(id: @cart_item.item_id)
      redirect_to item_path(@item.id), flash: {alert: "個数を選択してください"}
    end
  end
  
  def update

  end
  
  def destroy
    
  end
  
  def destroy_all
    @cart_items.destroy_all
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
