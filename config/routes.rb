Rails.application.routes.draw do

root "pages#home"

resources :pages
resources :posts
resources :users
resources :categories, only: [:index, :show]
resources :sessions, only: [:new, :create, :destroy]





get '/login', to: 'sessions#login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

get '/categories', to: 'categories#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
