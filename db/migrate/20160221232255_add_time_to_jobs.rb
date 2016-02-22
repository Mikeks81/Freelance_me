class AddTimeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :time, :time
  end
end
