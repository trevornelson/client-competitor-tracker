class UsersController < ApplicationController

  def new
    redirect_to root_url if session[:user_id]
  end

  def create

  end

  def scrape
    user = User.find_by(session[:user_id])
    user.scrape_competitors
    redirect_to root_url
  end

end
