class Customer::HomesController < ApplicationController
  def top
    @genres = Genre.all
    # 最新商品6件ピックアップ
    @items = Item.order(updated_at: :desc).limit(6)
    
  end

  def about
    @genres = Genre.all
  end
  
  
 
  
end
