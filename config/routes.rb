Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#home'

  resources :users
  resources :poke_pets
  resources :adoptions
  resources :towns

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/adoptions/poke_pet/:poke_pet_id', to: 'adoptions#new_pet', as: 'pet_adoption'
end
