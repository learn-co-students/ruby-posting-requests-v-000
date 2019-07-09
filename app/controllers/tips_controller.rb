class TipsController < ApplicationController
  def create
    resp = Faraday.post("https://api.foursquare.com/v2/tips/add") do |req|
      req.params['oauth_token'] = session[:token]
      req.params['v'] = '20190708'
      req.params['venueId'] = params[:venue_id]
      req.params['text'] = params[:tip]
    end

    redirect_to tips_path
  end

  def index
    resp = Faraday.get("https://api.foursquare.come/v2/tips/add") do |req|
      req.params['oauth_token'] = session[:token]
      req.params['v'] = '20190708'
    end
    @results = JSON.parse(resp.body)["response"]["tips"]["items"]
  end
end
