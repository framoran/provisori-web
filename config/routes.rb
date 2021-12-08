Rails.application.routes.draw do

  root to: 'home#index'

  resources :sessions
  resources :users
  resources :elements
  resources :comments
  resources :home

  resources :articles do
    resources :comments
    resources :elements
  end

  get 'article', to:'home#index'

  get 'login', to:'sessions#new'

  get 'signup', to:'users#new'

end
