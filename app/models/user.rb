class User < ActiveRecord::Base
	has_many :clients
	has_many :todos	
	has_many :jobs
	has_secure_password
end
