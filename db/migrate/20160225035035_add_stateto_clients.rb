class AddStatetoClients < ActiveRecord::Migration
  def change
  	add_column :clients, :state, :string
  end
end
