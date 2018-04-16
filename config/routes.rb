Rails.application.routes.draw do
  root 'searches#search'
  get '/search', to: 'searches#search'
  post '/search', to: 'searches#foursquare'

  get '/auth', to: 'sessions#create'
  get '/friends', to: 'searches#friends'
  resources :tips, only: [:index, :create]
<<<<<<< HEAD
  
=======
>>>>>>> 1abd9e7a2069284dbaef4834139f8fed19d78b72
end
