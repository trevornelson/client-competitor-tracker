require 'rails_helper'

describe CompetitorsController do
	describe "#index controller action" do
		let(:user) { User.create(email: "testuser1@example.com", password: "12345") }

		it "should render login page if session is unauthenticated" do
			get :index
			expect(response).to be_redirect
		end

		it "should render competitors index view if session is authenticated" do
			session[:user_id] = user.id
			get :index
			expect(response).to be_ok
		end
	end
end