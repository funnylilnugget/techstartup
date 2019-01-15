Rails.application.routes.draw do

root "pages#home"

resources :pages
resources :posts
resources :users


get '/login', to: 'sessions#login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
