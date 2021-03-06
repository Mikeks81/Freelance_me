class User < ActiveRecord::Base
	has_many :clients, dependent: :destroy
	has_many :todos, dependent: :destroy	
	has_many :jobs, dependent: :destroy
	has_many :expenses, dependent: :destroy
	has_many :payments, dependent: :destroy

	validates :fname, presence: true, on: :create
	validates :lname, presence: true, on: :create
	validates :email, presence: true, uniqueness: true, on: :create

	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

	mount_uploader :logo, LogoUploader

	def current_year_gross_income
		result = 0
		self.jobs.each do |j|
			if j.date_of_job.year == Time.now.year
				result += j.price
			end 
		end
		result
	end

	def ytd_revenue
		tot_expenses = 0
		self.expenses.each do |e|
			if e.date.year == Time.now.year
				tot_expenses += e.amount 
			end
		end
		revenue = current_year_gross_income - tot_expenses
	end

	def ytd_tot_payments
		tot_payments = 0
		self.payments.each do |p|
			if p.date.year == Time.now.year
				tot_payments += p.amount
			end
		end
		tot_payments
	end

	def ytd_tot_payments_due
		current_year_gross_income - ytd_tot_payments
	end

	def ytd_payment_recieved_percent 
		ytd_tot_payments.to_f/current_year_gross_income.to_f*100
	end

	def highest_price_job
		highest_job_price = 0 
		highest_job = ""
		self.jobs.each do |j|
			if j.date_of_job.year == Time.now.year
				if highest_job_price < j.price
					highest_job_price = j.price
					highest_job = j
				end
			end
		end
		highest_job
	end

	def ytd_totaljobs
	  ytd_totaljobs = 0
      self.jobs.each do |j|
        if j.date_of_job.year == Time.now.year
          ytd_totaljobs += 1
        end
      end
      ytd_totaljobs
	end 

	def ytd_totalclients
		ytd_totalclients = 0 
		self.clients.each do |j|
        if j.created_at.year == Time.now.year
          ytd_totalclients += 1
        end
      end
      ytd_totalclients
	end

end
