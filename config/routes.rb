Rails.application.routes.draw do
  root 'searches#search'

  resources :tips, only: [:index, :create]

  get '/search', to: 'searches#search'
  post '/search', to: 'searches#foursquare'

  get '/auth', to: 'sessions#create'
  get '/friends', to: 'searches#friends'

end
