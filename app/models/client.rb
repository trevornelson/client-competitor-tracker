class Client < ActiveRecord::Base
	belongs_to :competitor
	belongs_to :user
end