Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  root 'home#index'

  
  # User routes
  resources :users do
    resources :smoking_data, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :password_resets, only: [:new, :create, :edit, :update]
  # Session routes
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
end
