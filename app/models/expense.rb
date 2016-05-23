class Expense < ActiveRecord::Base
  belongs_to :job


  def self.job_total_expenses job_id
  	expenses = where(job_id: job_id)

  	total = 0
  	expenses.each do |e|
  		total += e.amount
  	end
  	total
  end
  
end
