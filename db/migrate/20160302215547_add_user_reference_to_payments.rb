class AddUserReferenceToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :user, index: true, foreign_key: true
  end
end
