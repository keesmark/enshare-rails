Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'signup', to: 'users#new'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :favorites
    end
  end

  resources :gears do
    resource :favorites, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end