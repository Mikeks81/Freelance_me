class User < ActiveRecord::Base
	has_many :clients, dependent: :destroy
	has_many :todos, dependent: :destroy	
	has_many :jobs, dependent: :destroy

	validates :fname, presence: true, on: :create
	validates :lname, presence: true, on: :create
	validates :email, presence: true, uniqueness: true, on: :create

	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

	mount_uploader :logo, LogoUploader
end
