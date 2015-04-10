class CompetitorsController < ApplicationController

	def index
		@competitors = Competitor.include(:clients).all
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
