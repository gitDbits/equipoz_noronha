Rails.application.routes.draw do
  root 'home#index'
  resources :equipment, only: [:new, :create, :show, :index]
  resources :categories, only: [:new, :create, :show, :index]
  resources :customers, only: [:new, :create, :show, :index]
  resources :contracts, only:[:new, :create, :show, :index] do
    resources :delivery_returns, only: [:new, :create]
    member do
      get 'delivery_receipt', to: 'delivery_receipts#show'
      post 'delivery_receipt', to: 'delivery_receipts#create'
      get 'delivery_return', to: 'delivery_returns#show'
    end
  end
end
