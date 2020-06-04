Rails.application.routes.draw do
  # home page
  root 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'

  # user
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/users/:id/leaved_baggage', to: 'users#leaved_baggage', as: 'users_leaved_baggage'
  post '/users/:id/leaved', to: 'users#leaved', as: 'users_leaved'
  get '/users/:id/received_baggage', to: 'users#received_baggage', as: 'users_received_baggage'
  resources :users

  # log in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
