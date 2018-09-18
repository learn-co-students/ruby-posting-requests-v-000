Rails.application.routes.draw do
  root 'searches#search'
  get '/search', to: 'searches#search'
  post '/search', to: 'searches#foursquare'
  resources :tips, only: [:index, :create]

  get '/auth', to: 'sessions#create'
  get '/friends', to: 'searches#friends'

end
