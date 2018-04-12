Rails.application.routes.draw do
  resources :tips, only: [:index, :create]
  root 'searches#search'
  get '/search', to: 'searches#search'
  post '/search', to: 'searches#foursquare'

  get '/auth', to: 'sessions#create'
  get '/friends', to: 'searches#friends'

end
