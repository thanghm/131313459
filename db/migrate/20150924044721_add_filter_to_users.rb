class AddFilterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :integer
  end
end
