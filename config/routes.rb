Rails.application.routes.draw do
  get 'searches/user_search'

  get 'searches/aea_search'

  # home page
  root 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'

  # user
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/users/searches', to: 'users#search', as: 'users_search'
  resources :users

  # log in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # baggage
  get 'baggages/:id/request_form', to: 'baggages#new', as: 'request_form'
  get 'baggages/:id/request', to: 'baggages#create', as: 'request'
  get 'baggages/:id/request_history', to: 'baggages#index', as: 'request_history'
  get 'baggages/:id/request_list', to: 'baggages#receives', as: 'request_list'
  get 'baggages/:id/approval', to: 'baggages#update', as: 'approval'
  get 'baggages/:id/transaction_history', to: 'baggages#received', as: 'transaction_history'

end
