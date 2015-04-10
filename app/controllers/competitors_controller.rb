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
		competitor = Competitor.new(competitor_params)
		session[:error] = competitor.errors.messages.first unless competitor.valid?
		redirect_to :back
	end

	private

	def competitor_params
		params.require(:competitor).permit(:name, :user_id)
	end

end
