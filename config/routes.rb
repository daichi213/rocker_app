Rails.application.routes.draw do

  # home page
  root 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'

  # user
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/users/searches', to: 'users#search', as: 'users_search'
  resources :users do
    # resources :baggages, only: [:request_content, :approval]
  end

  # user_search
  get 'searches/user_search'
  get 'searches/aea_search'

  # log in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # baggage_request
  get '/:id/baggages/request_form', to: 'baggages#new', as: 'request_form'
  post '/:id/baggages/request', to: 'baggages#create', as: 'request'
  post '/:id/baggages/destination', to: 'baggages#destination', as: 'destination'
  get '/:id/baggages/request_list', to: 'baggages#index', as: 'request_list'
  get '/:id/baggages/:baggage_request_id/request_content', to: 'baggages#receives', as: 'request_content'
  put '/:id/baggages/:baggage_request_id/approval', to: 'baggages#update', as: 'approval'
  get '/:id/baggages/transaction_history', to: 'baggages#transaction_history', as: 'transaction_history'

end
