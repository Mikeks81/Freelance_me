class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :user, index: true, foreign_key: true
      t.string :fname
      t.string :lname
      t.string :address
      t.string :business_name

      t.timestamps null: false
    end
  end
end
