class AddDateToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :date, :date
  end
end
