class AddCityToClients < ActiveRecord::Migration
  def change
    add_column :clients, :city, :string
  end
end
