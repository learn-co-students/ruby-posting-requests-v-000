class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.get("https://foursquare.com/oauth2/access_token") do |req|
      #req.params['client_id'] = ENV['FOURSQUARE_CLIENT_ID']
      #req.params['client_secret'] = ENV['FOURSQUARE_SECRET']
      req.params['client_id'] = '0W4LE0J2UHWQUYV5EUIGLOK15H1UK2FI23N2JUK00Z4DCXNH'
      req.params['client_secret'] = 'OWUHU1CDMNK0IOXU3ROQC45OKIUGVVCYCOWL1ZXZJFRTEZUX'
      req.params['grant_type'] = 'authorization_code'
    #  req.params['redirect_uri'] = "http://localhost:3000/auth"
      req.params['redirect_uri'] = "http://67.205.165.109.44551/auth"
      req.params['code'] = params[:code]
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end
end
