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

  
   def start_time
        self.date_of_job ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship .my_related_model
    end

    # def num_of_jobs_per_month
    	

    	
    # end
end
