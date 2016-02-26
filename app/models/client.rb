class Client < ActiveRecord::Base
  belongs_to :user
  has_many :jobs, dependent: :destroy
  def self.search(search)
  	where("fname ILIKE ?", "%#{search}%") 
  	# where("lname ILIKE ?", "%#{search}%")
  	# where("business_name ILIKE ?", "%#{search}%")
  end
end
