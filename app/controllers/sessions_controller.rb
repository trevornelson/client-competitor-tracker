class SessionsController < ApplicationController

	def new
		redirect_to root_url if session[:user_id]
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session.delete(:error_msg)
			session[:user_id] = user.id
			redirect_to root_url
		else
			session[:error_msg] = "Invalid username and/or password."
			redirect_to login_path
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to login_path
	end

end
