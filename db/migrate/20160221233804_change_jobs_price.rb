class ChangeJobsPrice < ActiveRecord::Migration
  def change
  	def up
    	change_table :products do |t|
      	t.change :price, :integer
      	t.change :balance, :integer
    	end
  	end
 
  	def down
    	change_table :products do |t|
      	t.change :price, :decimal, :precision => 8, :scale => 2
      	t.change :balance, :decimal, :precision => 8, :scale => 2
    	end
  	end
  end
end
