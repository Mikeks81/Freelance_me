class RemoveBalanceFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :balance, :integer
  end
end
