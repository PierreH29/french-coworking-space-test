Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :requests, only: [:index, :show, :edit, :update]

  resources :users, only: [:new, :create] do
    member do
      get 'confirm'
      get 'refresh'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
