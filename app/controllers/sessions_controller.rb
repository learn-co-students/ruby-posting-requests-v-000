class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.get("https://foursquare.com/oauth2/access_token") do |req|
      req.params['client_id'] = "ZNGFAGHHFLSVHSNO51ANV20E3XTWTH4F5212DBD3BN05RD1G"#ENV['FOURSQUARE_CLIENT_ID']
      req.params['client_secret'] = "OYE4WVEUCIB01AEF3OZHY35A2QJ3C5PAH2WSMHI4N44W1YOX"#ENV['FOURSQUARE_SECRET']
      req.params['grant_type'] = 'authorization_code'
      req.params['redirect_uri'] = "http://localhost:3000/auth"
      req.params['code'] = params[:code]
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end
end
