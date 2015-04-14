class UsersController < ApplicationController

  def new
    redirect_to root_url if session[:user_id]
  end

  def create
    user = User.create(user_params)
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to :back
    end
  end

  def scrape
    user = User.find_by(id: session[:user_id])
    user.scrape_competitors
    redirect_to root_url
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
