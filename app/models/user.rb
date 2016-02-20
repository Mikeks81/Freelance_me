class User < ActiveRecord::Base
	has_many :clients	
	has_secure_password
end
