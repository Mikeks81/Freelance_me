class AddZiptoClients < ActiveRecord::Migration
  def change
  	add_column :clients, :zip, :integer
  end
end
