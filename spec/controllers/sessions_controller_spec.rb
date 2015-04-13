require 'rails_helper'

describe SessionsController do
	describe "#new controller action" do

		it "should render login page" do
			get :new
			expect(response).to render_template(:new)
		end

	end

	describe "#create controller action" do
		before(:all) do
			User.create(email: 'testuser@example.com', password: '12345')
		end
		
		it "should add user_id to session if credentials are correct" do
			post :create, {email: 'testuser@example.com', password: '12345'}
			expect(response.code).to eq("302")
			expect(response).to redirect_to(root_path)
		end

		it "should redirect back to login page if credentials are not correct" do
			post :create, {email: 'testuser@example.com', password: 'wrong'}
			expect(response.code).to eq("302")
			expect(response).to redirect_to(login_path)
		end
	end
end