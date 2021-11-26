Rails.application.routes.draw do

  root to: 'home#index'


  resources :sessions
  resources :users

  resources :articles do
    resources :comments, only: [:new, :create]
  end

end
