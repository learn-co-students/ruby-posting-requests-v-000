class TipsController < ApplicationController
    def create
      resp = Faraday.post("https://api.foursquare.com/v2/tips/add") do |req|
        req.params['oauth_token'] = session[:token]
        req.params['v'] = '20180614'
        req.params['venue_id'] = params[:venue_id]
        req.params['text'] = params[:tip]
      end
      redirect_to tips_path
    end
end
