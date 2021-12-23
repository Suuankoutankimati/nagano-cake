class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
    @genres = Genre.all
  end

  def edit
    @customer = current_customer
    @genres = Genre.all
  end

  def update
    @genres = Genre.all
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path(@customer)
    else
      render "edit"
    end

  end

  def unsubscribe
  end

  def withdraw
    # 現在ログインしている顧客であること
    @customer = Customer.where(id: current_customer.id)
    # 退会フラグを立てる
    if @customer.update(is_deleted: true)
      # ログアウトさせる
      reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
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
