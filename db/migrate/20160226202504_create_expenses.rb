class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.text :description
      t.decimal :amount
      t.date :date
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
