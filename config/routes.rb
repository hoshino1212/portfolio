Rails.application.routes.draw do
  root 'home#index'

  # User routes
  resources :users, only: [:new, :create, :show]

  # Session routes
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
end
