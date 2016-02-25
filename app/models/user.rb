class User < ActiveRecord::Base
	has_many :clients
	has_many :todos	
	has_secure_password
end
