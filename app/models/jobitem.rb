class Jobitem < ActiveRecord::Base
  belongs_to :job
  validates_presence_of :name
  validates_presence_of :price

  def self.jobitem_tot_price job_id
		jobitems = where(job_id: job_id)
		total_itemized = 0

		jobitems.each do |j|
			total_itemized = total_itemized + j.price
		end
		total_itemized
	end


end
