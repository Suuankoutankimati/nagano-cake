Rails.application.routes.draw do

  namespace :admin do
    root "orders#index"
    resources :items,except: :destroy
    resources :genres,except: [:destroy, :new, :show]
    resources :order_details,only: [:update]
    resources :orders,except: [:destroy, :create, :new, :edit]
    resources :customers,except: [:destroy, :create, :new]
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

    resources :contacts, only:[:new,:create] do
      collection do
        post "confirm"
        post "back"
        get "done"
      end
    end
  end
end
