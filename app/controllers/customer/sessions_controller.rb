# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
  def customer_state
    # Eメールが一致する顧客情報あるか確認
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      # パスワードが正しい・active_for_authentication?メソッドがfalseであれば、
      if (@customer.valid_password? (params[:customer][:password]) && (@customer.active_for_authentication? == false))
        redirect_to new_customer_session_path
      end
    end
  end

  

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
