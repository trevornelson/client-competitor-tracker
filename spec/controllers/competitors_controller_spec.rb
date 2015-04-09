require 'rails_helper'

describe CompetitorsController do
	describe "#index controller action" do
		request { get :index }

		it "should render login page if session is unauthenticated" do
			request.should redirect_to '/login'
		end

		it "should render competitors index view if session is authenticated" do
			session[:user_id] = 1
			expect(response).to be_ok
		end
	end
end