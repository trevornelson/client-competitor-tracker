class User < ActiveRecord::Base
	has_many :competitors

	has_secure_password
end