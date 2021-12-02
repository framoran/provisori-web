Rails.application.routes.draw do

  root to: 'home#index'

  resources :sessions
  resources :users
  resources :elements

  resources :articles do
    resources :comments, only: [:new, :create]
    resources :elements
  end

  get 'login', to:'sessions#new'

  get 'signup', to:'users#new'

end
