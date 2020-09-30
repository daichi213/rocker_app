Rails.application.routes.draw do

  # home page
  root 'static_pages#home'
  post '/get_location', to: 'static_page#create'
  get '/about', to: 'static_pages#about', as: 'about'

  # user
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/users/searches', to: 'users#search', as: 'users_search'
  resources :users

  # user_search
  get 'searches/user_search'
  get 'searches/area_search'

  namespace :api do
    get 'search/search'
  end

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
  patch '/:id/baggages/:baggage_request_id/update', to: 'baggages#update', as: 'approval'
  patch '/:id/baggages/:baggage_request_id/refuse', to: 'baggages#refuse', as: 'refuse'
  get '/:id/baggages/approval_requests', to: 'baggages#approval_requests', as: 'approval_requests'
  get '/:id/baggages/intend_to_requests', to: 'baggages#intend_to_requests', as: 'intend_to_requests'

  # transaction
  get '/:id/transactions/receives_index', to: 'transactions#receives_index', as: 'receives_index'
  get '/:id/transactions/leaves_index', to: 'transactions#leaves_index', as: 'leaves_index'
  get '/:id/transactions/receiving_index', to: 'transactions#receiving_index', as: 'receiving_index'
  get '/:id/transactions/leaving_index', to: 'transactions#leaving_index', as: 'leaving_index'
  get '/:id/transactions/:baggage_request_id/receives_show', to: 'transactions#receives_show', as: 'receives_show'
  get '/:id/transactions/:baggage_request_id/leaves_show', to: 'transactions#leaves_show', as: 'leaves_show'
  patch '/:id/transactions/transaction_start/:baggage_request_id', to: 'transactions#transaction_start', as: 'transaction_start'
  get '/:id/transactions/:baggage_request_id/receiving_show', to: 'transactions#receiving_show', as: 'receiving_show'
  get '/:id/transactions/:baggage_request_id/leaving_show', to: 'transactions#leaving_show', as: 'leaving_show'
  patch '/:id/transactions/transaction_terminate/:baggage_request_id', to: 'transactions#transaction_terminate',
                                                                   as: 'transaction_terminate'
  get '/:id/transactions/transaction_history', to: 'transactions#transaction_history', as: 'transaction_history'

  # message
  get '/:id/messages/:baggage_request_to_id/message_page', to: 'messages#new', as: 'message_page'
  post '/:id/messages/:baggage_request_to_id/post', to: 'messages#create', as: 'message_post'
  get '/:id/messages/:baggage_request_to_id/api/messages', to: 'api/messages#index'

  # Inquiry page
  get '/:id/help', to: 'inquiries#new', as: 'help'
  get '/:id/index', to: 'inquiries#index', as: 'index'
  get '/:id/get_solution/:inquiry_id', to: 'inquiries#get_solution', as: 'get_solution'
  post '/:id/help', to: 'inquiries#create', as: 'send_help'
  post '/:id/solutions/:inquiry_id', to: 'inquiries#solution', as: 'solution'
  post '/:id/inquiry_reply/:inquiry_id', to: 'inquiries#inquiry_reply', as: 'inquiry_reply'
end
