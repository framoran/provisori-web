Rails.application.routes.draw do

  root to: 'home#index'

  scope '/:locale' do

    put '/post/:id/like', to: 'articles#like', as: 'like'

    post '/games/check_response', to: 'games#check_response', as: 'check_response'

    get '/games/winner', to: 'games#winner', as: 'winner'

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

    get 'users_all', to:'users#all'

  end

end
