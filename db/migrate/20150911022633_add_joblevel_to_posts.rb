class AddJoblevelToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :joblevel, :string
  end
end
