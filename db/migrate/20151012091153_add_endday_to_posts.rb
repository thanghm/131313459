class AddEnddayToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :endday, :datetime
    add_column :posts, :address, :string
  end
end
