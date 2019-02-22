class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.get("https://foursquare.com/oauth2/access_token") do |req|
      req.params['client_id'] = 'LVJEVJ4BCTANBM5CY1FYBULOYBLIQXYHM4NM22HOTLVJCKAS'
      req.params['client_secret'] = '1GSGX0OQCLKOMYKISRAMFTGYPUSC00NGK1FJTB2WKSPO2QAY'
      req.params['grant_type'] = 'authorization_code'
      req.params['redirect_uri'] = "http://localhost:3000/auth"
      req.params['code'] = params[:code]
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end
end
