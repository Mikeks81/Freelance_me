class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :client, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.string :pdf

      t.timestamps null: false
    end
  end
end
