class Job < ActiveRecord::Base
  belongs_to :client
  has_many :expenses
  has_many :jobitems
  has_many :payments
  
   def start_time
        self.date_of_job ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship .my_related_model
    end
end
