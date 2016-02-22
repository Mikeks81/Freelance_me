class ChangeJobsEndDate < ActiveRecord::Migration
  def change
	  def up
	    change_table :jobs do |t|
	      t.change :date_of_end, :string
	    end
	  end
	 
	  def down
	    change_table :jobs do |t|
	      t.change :date_of_end, :date
	    end
	  end
  end
end
