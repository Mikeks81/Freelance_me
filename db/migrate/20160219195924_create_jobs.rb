class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :client, index: true, foreign_key: true
      t.text :job_description
      t.integer :price
      t.date :date_of_job
      t.integer :balance
      t.boolean :job_complete
      t.boolean :balance_zero
      t.text :notes

      t.timestamps null: false
    end
  end
end
