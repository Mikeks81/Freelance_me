class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  has_many :expenses, dependent: :destroy
  has_many :jobitems, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :job_description, presence: true
  validates :date_of_job, presence: true
  validates :price, presence: true
  validates :balance, presence: true 

  # self.per_page = 6
  
   def start_time
        self.date_of_job ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship .my_related_model
    end

    def self.job_total_payments job_id
      payments = Payment.where(job_id: job_id)
      total = 0 

        payments.each do |p|
          total += p.amount
        end
      total
    end

    def self.job_total_expenses job_id
      expenses = Expense.where(job_id: job_id)
      total = 0

        expenses.each do |e|
          total += e.amount
        end
      total
    end

    def self.job_total_jobitems job_id
      job_items = Jobitem.where(job_id: job_id)
      total = 0

        job_items.each do |t|
          total += t.price
        end
      total
    end

    def self.job_current_balance job_id
        tot_payments = Job.job_total_payments(job_id)
        job = self.find(job_id)
        job.price - tot_payments
    end

    def self.job_current_revenue job_id
        tot_rev = Job.job_total_expenses(job_id)
        job = self.find(job_id)
        job.price - tot_rev
    end

end
