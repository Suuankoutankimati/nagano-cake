Rails.application.routes.draw do

  namespace :admin do
    root "homes#top"
    resources :items
    resources :genres
    resources :order_details,only: [:update]
    resources :orders
    resources :customers

  end

  #管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  #顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  # 顧客側
  scope module: :customer do
    resources :orders,only: [:index,:show,:new,:create] do
      collection do
        post 'confirm'
        get 'completion'
      end
    end

    root "homes#top"
    get "about" => "homes#about"

    resources :customers,only: [:show,:edit,:update] do
      collection do
        get "unsubscribe"
        patch "withdraw"
      end
    end

    resources :addresses,only: [:index,:edit,:create,:update,:destroy] do
    end

    resources :cart_items,only:[:index,:update,:create,:destroy] do
      collection do
        delete "destroy_all"
      end
    end

    resources :items,only: [:index,:show]
  end

end
