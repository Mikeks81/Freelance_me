class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.date :date
      t.string :form
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
