class AddPositionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :position, :string
  end
end
