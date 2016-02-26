class CreateJobitems < ActiveRecord::Migration
  def change
    create_table :jobitems do |t|
      t.text :name
      t.date :date
      t.decimal :price
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
