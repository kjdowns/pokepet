Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#home'

  resources :users, only: [:new, :create, :show] do
    resources :adoptions, only: [:show]
  end
  resources :poke_pets, only: [:index] do
    resources :adoptions, only: [:new]
  end

  resources :adoptions, only: [:new, :create, :show, :update, :destroy]

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get 'auth/google_oauth2/callback', to: 'sessions#google'

  get '/towns', to: 'towns#index'
  get '/bank', to: 'towns#bank'
  post '/bank', to: 'towns#bank_action'
  get '/shop', to: 'towns#shop'
  post '/shop', to: 'towns#shop_action'
  get '/training', to: 'towns#training'
  post '/training', to: 'towns#training_action'
  get '/grove', to: 'towns#grove'

end
