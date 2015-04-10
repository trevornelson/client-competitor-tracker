require 'rails_helper'

describe CompetitorsController do
	describe "#index controller action" do

		it "should render login page if session is unauthenticated" do
			get :index
			expect(response).to be_redirect
		end

		it "should render competitors index view if session is authenticated" do
			session[:user_id] = 1
			get :index
			expect(response).to be_ok
		end
	end
end