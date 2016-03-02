class Client < ActiveRecord::Base
  belongs_to :user
  has_many :jobs, dependent: :destroy

  self.per_page = 6

  def self.search(search)
  	where("fname ILIKE? OR lname ILIKE? OR business_name ILIKE? OR email ILIKE?","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
  end
end
