Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root 'home#index'
  get 'users/new', to: 'users#new', as: 'new_user'
  post 'users', to: 'users#create'
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
end
