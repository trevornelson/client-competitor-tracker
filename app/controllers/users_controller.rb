class UsersController < ApplicationController

  def scrape
    user = User.find_by(session[:user_id])
    user.scrape_competitors
    redirect_to root_url
  end

end
