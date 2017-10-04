class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.get("https://foursquare.com/oauth2/access_token") do |req|
      req.params['client_id'] = 'PEJPUA40W4VNUJUHNU14UALHI3JKYT1LNS5SKWMTBR4J3VXL'
      req.params['client_secret'] = 'VVP2PRW4GGWLQMWCK3E3LM22AOOZNAFW3FSGYK4PKCPPHDGN'
      req.params['grant_type'] = 'authorization_code'
      req.params['redirect_uri'] = "http://localhost:3000/auth"
      req.params['code'] = params[:code]
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end
end
