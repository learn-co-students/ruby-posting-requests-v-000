class SearchesController < ApplicationController

  
  def search
    
  end


  def friends
    resp = Faraday.get("https://api.foursquare.com/v2/users/self/friends") do |req|
      req.params['oauth_token'] = session[:token]
      # don't forget that pesky v param for versioning
      req.params['v'] = '20160201'
    end
    @friends = JSON.parse(resp.body)["response"]["friends"]["items"]
  end

  def foursquare
    client_id = "ZNGFAGHHFLSVHSNO51ANV20E3XTWTH4F5212DBD3BN05RD1G"#ENV['FOURSQUARE_CLIENT_ID']
    client_secret = "OYE4WVEUCIB01AEF3OZHY35A2QJ3C5PAH2WSMHI4N44W1YOX"#ENV['FOURSQUARE_SECRET']

    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    

    body = JSON.parse(@resp.body)

    if @resp.success?
      @venues = body["response"]["venues"]
    else
      @error = body#["meta"]["errorDetail"]
    end
    render 'search'

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
      render 'search'
  end
end
