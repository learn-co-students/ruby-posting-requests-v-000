class TipsController < ApplicationController

  def index
    resp = Faraday.get("https://api.foursquare.com/v2/self/tips") do |req|
      req.params['oauth_token'] = session[:token]
      req.params['v'] = '20160427'
    end
    body_hash = JSON.parse(resp)
    binding.pry
    @results = body_hash['response']['list']['listItems']['items']
  end

  def create
    resp = Faraday.post("https://api.foursquare.com/v2/tips/add") do |req|
      req.params['oauth_token'] = session[:token]
      req.params['v'] = '20160427'
      req.params['oauth_token'] = params[:venue_id]
      req.params['text'] = session[:tip]
    end
    rediecrt_to tips_path
  end

end
