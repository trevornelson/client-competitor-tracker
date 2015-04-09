require 'rails_helper'

describe SessionsController do
	describe "#new controller action" do

		it "should render login page" do
			get '/login'
			expect(response).to be_ok
		end

	end

	describe "#create controller action" do
		let(:user) {User.new(email: 'test@example.com', password: '12345')}

		it "should add user_id to session if credentials are correct" do
			post :new_session, {email: 'test@example.com', password: '12345'}
			expect(session[:user_id]).to be_nil
		end

		it "should redirect back to login page if credentials are not correct" do
			post :new_session, {email: 'test@example.com', password: 'wrong'}
			expect(session[:user_id]).to be
		end
	end
end