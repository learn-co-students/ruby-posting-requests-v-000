class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.get("https://foursquare.com/oauth2/access_token") do |req|
      req.params['client_id'] = '2XDNHEYIHQ5EV4RI3IWVZKP42UCFHAPX0IXCULNJ2QSZONO2'
      req.params['client_secret'] = '3O5WSCODVRFS40RACBZPRMG0ANSBFMYMDUENDL0FDH0YKC3C'
      req.params['grant_type'] = 'authorization_code'
      req.params['redirect_uri'] = "http://localhost:3000/auth"
      req.params['code'] = params[:code]
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end
end
