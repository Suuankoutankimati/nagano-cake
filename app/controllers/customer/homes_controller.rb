class Customer::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre.all
  end

  def about
    @genres = Genre.all
  end
end
