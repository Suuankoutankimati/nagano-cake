class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def new
    @item=Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_items_path
    else
      flash[:danger] = "商品が保存されていません。"
      redirect_to admin_items_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      flash[:item_updated_error] = "商品が保存されていません"
      redirect_to edit_admin_item_path(@item)
    end
  end

  private
   def item_params
    params.require(:item).permit(:name, :genre_id, :non_tax_price, :image, :introduction, :is_active)
   end

end
