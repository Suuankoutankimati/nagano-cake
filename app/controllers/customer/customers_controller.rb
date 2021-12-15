class Customer::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_path)
      redirect_to customer_path(@customer)
    else
      render "edit"
    end
  end

  def unsubscribe
  end
  
  def withdraw
    @customer = Customer.where(id: current_customer.id)
    if @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    else
      render "show"
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :post_code, :address, :phone_number, :email, :is_deleted)
  end
end
