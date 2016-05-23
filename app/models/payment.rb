class Payment < ActiveRecord::Base
  belongs_to :job


  def self.job_total_payments job_id
  	payments = where(job_id: job_id)

  	total = 0 

  	payments.each do |p|
  		total += p.amount
  	end
  	total
  end
end
