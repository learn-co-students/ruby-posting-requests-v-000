class TipsController < ApplicationController

  def create
    resp = Faraday.post("https://api.foursquare.com/v2/tips/add") do |req|
      req.params['oauth_token'] = session[:token]
      req.params['v'] = '20160201'
      req.params['venueId'] = params[:venue_id]
      req.params['text'] = params[:tip]
    end
    # www-form-urlencoded

    redirect_to tips_path
  end


end


# if an API wants JSON:
# Faraday.post("https://url/to/api") do |req|
#   req.body = "{ "my_param": my_value }"
# end
