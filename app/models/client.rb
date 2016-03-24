class Client < ActiveRecord::Base
  belongs_to :user
  has_many :jobs, dependent: :destroy

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true
  # validates :phone, numericality: true
  validates :zip, numericality: true

  self.per_page = 6

  def self.search(search)
  	where("fname ILIKE? OR lname ILIKE? OR business_name ILIKE? OR email ILIKE?","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
  end
end
