class TipsController < ApplicationController

    def index
        resp = Faraday.get('https://api.foursquare.com/v2/lists/self/tips') do |req|
            req.params['oauth_token'] = session[:token]
            req.params['v'] = '20160201'
        end

        @results = JSON.parse(resp.body)['response']['list']['listItems']['items']
    end

    def create
        resp = Faraday.post('https://api.foursquare.com/v2/tips/add') do |req|
            req.params['oauth_token'] = session[:token]
            req.params['v'] = '20160201'
            req.params['venueId'] = params[:venue_id]
            req.params['text'] = params[:tip]
        end

        # Other API providers, like Github, may require that POST data instead be JSON-formatted text in the request body. A request has a body just like a response does.

        # Fortunately, Faraday makes it easy to POST with JSON in the body of the request by doing this:

            # Faraday.post("https://url/to/api") do |req|
            #     req.body = "{ "my_param": my_value }"
            # end

        redirect_to tips_path
    end

end
