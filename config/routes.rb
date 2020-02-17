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

  get '/towns', to: 'towns#index'
  get '/bank', to: 'towns#bank'
  get '/shop', to: 'towns#shop'
  get '/park', to: 'towns#park'

end
