class CompetitorsController < ApplicationController

	def index
		@user = User.find_by(id: session[:user_id])
		unless @user
			redirect_to login_url
		else
			@competitors = @user.competitors.includes(:clients)
		end
	end

	def create
		user = User.find(session[:user_id])
		competitor = user.competitors.create(competitor_params)
		redirect_to :back
	end

	private

	def competitor_params
		params.permit(:name, :client_url, :client_xpath)
	end

end
