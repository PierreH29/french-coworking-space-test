Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin } do
  end

  devise_for :users
  root to: 'pages#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :requests, only: [:index, :show, :edit, :update]

  resources :users, only: [:new, :create] do
    member do
      get 'confirm'
      get 'refresh'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
