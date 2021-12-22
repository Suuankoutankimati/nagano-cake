class Admin::CustomersController < ApplicationController
  layout 'admin.html.erb'
  before_action :authenticate_admin!
  # before_action :if_not_admin
   def index
    @customers = Customer.all
   end
  # 論理削除されたデータも「含める」
  # Model.with_deleted

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render "edit"
    end
  end



  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :post_code, :address, :phone_number, :email, :is_deleted)
  end
  
  
end


