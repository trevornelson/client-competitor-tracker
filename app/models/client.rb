class Client < ActiveRecord::Base
	belongs_to :competitor
	belongs_to :user

  def updated_at_to_s
    updated_at.strftime("%m/%d/%Y")
  end

  def self.updated_in_past_year
    where("updated_at > ?", Time.now - 365.days).count
  end

  def self.dropped_in_past_year
    where("updated_at > ? AND dropped = ?", Time.now - 365.days, true).count
  end
end