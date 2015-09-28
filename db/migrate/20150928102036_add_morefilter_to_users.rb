class AddMorefilterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :about, :string
    add_column :users, :letter, :string
  end
end
