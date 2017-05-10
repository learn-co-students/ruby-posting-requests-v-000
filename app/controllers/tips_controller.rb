class TipsController < ApplicationController
	def create
		resp=Faraday.post('https://api.foursquare.com/v2/tips/add') do |req|
			req.params[:venueId]=params[:venue_id]
			req.params[:text]=params[:tip]
			req.params[:oauth_token]=session[:token]
			req.params[:v]='20160201'
		end 
	redirect_to tips_path
	end 

	def index 
		resp=Faraday.get('https://api.foursquare.com/v2/users/self/tips') do |req|
			req.params[:oauth_token]=session[:token]
			req.params[:v]='20160201'
		end 
	body=JSON.parse(resp.body)
	@tips=body['response']['tips']['items']
	render 'index'
	end 
end
