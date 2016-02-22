class RemoveDateOfEndFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :date_of_end, :string
  end
end
