Rails.application.routes.draw do
  root 'homes#top'
  namespace :admin do
    resources :items
    resources :genres
  end
  #管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  #顧客用
  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }
end
