class AddDateOfEndToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :date_of_end, :date
  end
end
