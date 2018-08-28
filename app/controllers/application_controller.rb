class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

private

  def authenticate_user
    #client_id = ENV['FOURSQUARE_CLIENT_ID']
    client_id='0W4LE0J2UHWQUYV5EUIGLOK15H1UK2FI23N2JUK00Z4DCXNH'
  #  raise client_id.inspect
    redirect_uri = CGI.escape("http://67.205.165.109.44551/auth")
    foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    redirect_to foursquare_url unless logged_in?
  end

  def logged_in?
    !!session[:token]
  end
end
