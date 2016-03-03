class AddUserReferenceToExpenses < ActiveRecord::Migration
  def change
    add_reference :expenses, :user, index: true, foreign_key: true
  end
end
