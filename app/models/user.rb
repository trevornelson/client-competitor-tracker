class User < ActiveRecord::Base
	has_many :competitors

	has_secure_password

  def scrape_competitors
    competitors.each do |competitor|
      competitor.fetch_clients
    end
  end
end