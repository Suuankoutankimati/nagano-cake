Rails.application.routes.draw do
  #管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  #顧客用
  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  scope module: :customer do
    resources :orders,only: [:index,:show,:new,:create] do
        collection do
          post 'confirm'
          get 'completion'
        end
      end
  end
end
