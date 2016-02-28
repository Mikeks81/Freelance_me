class Client < ActiveRecord::Base
  belongs_to :user
  has_many :jobs, dependent: :destroy

  self.per_page = 10

  def self.search(search)
  	where("fname ILIKE? OR lname ILIKE? OR business_name ILIKE?","%#{search}%","%#{search}%","%#{search}%")
  end
end
