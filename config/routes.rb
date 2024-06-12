Rails.application.routes.draw do
  root 'home#index'

  # User routes
  resources :users do
    resources :smoking_data, only: [:new, :create, :edit, :update, :destroy]
  end

  # Session routes
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
end
