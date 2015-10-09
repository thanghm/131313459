class AddCategoriesToUsers < ActiveRecord::Migration
  def up
    add_column :users, :skill, :string
  end

  def down
    remove_column :users, :categories, :string
  end
end
