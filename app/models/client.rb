class Client < ActiveRecord::Base
	belongs_to :competitor
	belongs_to :user

  def updated_at_to_s
    updated_at.strftime("%m/%d/%Y")
  end
end