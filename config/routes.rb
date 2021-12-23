Rails.application.routes.draw do

  namespace :admin do
    root "orders#index"
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

    # get "customer/mypage" => "customers#show"
    resource :customers,only: [:show] do
      collection do
        get "unsubscribe"
        patch "withdraw"
        get "mypage/edit" => "customers#edit"
        patch "mypage/update" => "customers#update"
      end
    end

    resources :addresses,only: [:index,:edit,:create,:update,:destroy] 

    resources :cart_items,only:[:index,:update,:create,:destroy] do
      collection do
        delete "destroy_all"
      end
    end

    resources :items,only: [:index,:show] do
      collection do
        get "search"
      end
    end
    
    resources :genres, only: [:show]
    
    # resources :contacts, only:[:new,:create] do
    #   collection do
    #     post "confirm"
    #     post "back"
    #     get "done"
    #   end
    # end
  end
end
