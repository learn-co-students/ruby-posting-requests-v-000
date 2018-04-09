class TipsController < ApplicationController

  def create
    @resp = Faraday.post 'https://api.foursquare.com/v2/tips/add' do |req|
      req.params['oauth_token'] = session[:token]
      req.params['v'] = '20180201'
      req.params['venueId'] = params[:venue_id]
      req.params['text'] = params[:text]
    end

    redirect_to tips_path
  end

  def index
    resp = Faraday.get 'https://api.foursquare.com/v2/lists/self/tips' do |req|
      req.params['oauth_token'] = session[:token]
      req.params['v'] = '20180201'
    end
  end
  parse_results = JSON.parse(resp.body)
  @results = parse_results['response']['listItems']['items']

  render 'index'
end
