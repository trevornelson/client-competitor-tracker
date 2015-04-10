class SessionsController < ApplicationController

	def new
		redirect_to root_url if session[:user_id]
	end

	def create
		user = User.find_by(email: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			session.delete(:error)
			session[:user_id] = user.id
			redirect_to root_url
		else
			session[:error] = "invalid username and/or password"
			redirect_to new_session_path
		end
	end

end
