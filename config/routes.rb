Rails.application.routes.draw do

  root to: 'home#index'

  put '/post/:id/like', to: 'articles#like', as: 'like'

  get 'game', to: 'games#index'

  resources :sessions
  resources :users
  resources :elements
  resources :comments
  resources :home
  resources :games

  resources :articles do
    resources :comments
    resources :elements
  end

  get 'article', to:'home#index'

  get 'login', to:'sessions#new'

  get 'signup', to:'users#new'

end
