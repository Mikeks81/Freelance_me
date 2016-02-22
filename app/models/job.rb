class Job < ActiveRecord::Base
  belongs_to :client

   def start_time
        self.date_of_job ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship .my_related_model
    end
end
