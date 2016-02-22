class AddPriceToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :price, :decimal, :precision => 8, :scale => 2
  end
end
