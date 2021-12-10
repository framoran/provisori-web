Rails.application.routes.draw do

  get 'game/new'
  get 'game/create'
  get 'controllergame/new'
  get 'controllergame/create'
  root to: 'home#index'

  put '/post/:id/like', to: 'articles#like', as: 'like'

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
