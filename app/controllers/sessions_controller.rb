class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.get("https://foursquare.com/oauth2/access_token") do |req|
      req.params['client_id'] = ENV['VFGYFQC5S0OLTCG523Y0SAUVZK3ONN3KETVKCM5TS0QEXBRN']
      req.params['client_secret'] = ENV['0NNKMRWRYLCKLPSEE3G10I33WV0BTYXEN2JCJ41TVKKWB52Y']
      req.params['grant_type'] = 'authorization_code'
      req.params['redirect_uri'] = "http://159.203.84.37:30004/auth"
      req.params['code'] = params[:code]
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end
end
