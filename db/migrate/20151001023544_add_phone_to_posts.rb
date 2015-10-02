class AddPhoneToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :phone, :string
    add_column :posts, :map, :string
  end
end
