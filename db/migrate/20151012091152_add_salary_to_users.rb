class AddSalaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salary, :string
  end
end
