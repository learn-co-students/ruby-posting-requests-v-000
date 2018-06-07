Rails.application.routes.draw do
  root 'searches#search'
  get  '/search',  to: 'searches#search'
  post '/search',  to: 'searches#foursquare'
  get  '/friends', to: 'searches#friends'

  get '/auth', to: 'sessions#create'
  
  resources :tips, :only => [:index, :create]
end
