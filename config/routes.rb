Rails.application.routes.draw do

  root 'pages#index'
  post 'flight_search', to: 'flights#flight_search', as: 'flight_search'
  post 'index_search', to: 'flights#index_search', as: 'index_search'
  resources :flights
  resources :bookings
  post 'booking_create', to: 'bookings#create', as: 'booking_create'
  get 'booking_confirmed/:id', to: 'bookings#booking_confirmed', as: 'booking_confirmed'
  get 'auth/:provider/callback', to: "sessions#create"
  get 'get_code', to: 'bookings#get_code', as: 'get_cod'
  delete 'sign_out', to: "sessions#destroy", as: "sign_out"
  get 'user_profile', to: 'bookings#user_profile', as: 'user_profile'
  resources :users
end
