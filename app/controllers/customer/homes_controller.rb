class Customer::HomesController < ApplicationController
  def top
    @items = Item.all
  end

  def about
    @atsushi = current_customer.address
  end
end
