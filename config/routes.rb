Rails.application.routes.draw do

  # home page
  root 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'

  # user
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/users/searches', to: 'users#search', as: 'users_search'
  resources :users
  resources :account_activations, only: [:edit]

  # user_search
  get 'searches/user_search'
  get 'searches/aea_search'

  # log in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # baggage_request
  get 'baggages/:id/request_form', to: 'baggages#new', as: 'request_form'
  post 'baggages/:id/request', to: 'baggages#create', as: 'request'
  get 'baggages/:id/destination_list', to: 'baggages#destination_list', as: 'destination_list'
  post 'baggages/:id/destination', to: 'baggages#destination', as: 'destination'
  get 'baggages/:id/request_history', to: 'baggages#index', as: 'request_history'
  get 'baggages/:id/request_list', to: 'baggages#receives', as: 'request_list'
  put 'baggages/:id/approval', to: 'baggages#update', as: 'approval'
  get 'baggages/:id/transaction_history', to: 'baggages#received', as: 'transaction_history'

end
