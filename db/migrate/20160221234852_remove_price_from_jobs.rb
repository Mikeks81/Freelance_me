class RemovePriceFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :price, :integer
  end
end
