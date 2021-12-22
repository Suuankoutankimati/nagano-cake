class Customer::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
  def search
    @genres = Genre.all
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    render "search"
  end

end
