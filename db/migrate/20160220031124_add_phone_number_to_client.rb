class AddPhoneNumberToClient < ActiveRecord::Migration
  def change
    add_column :clients, :phone, :string
  end
end
