class AddBalanceToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :balance, :decimal, :precision => 8, :scale => 2
  end
end
