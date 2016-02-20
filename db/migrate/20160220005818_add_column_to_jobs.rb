class AddColumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :date_of_end, :string
  end
end
