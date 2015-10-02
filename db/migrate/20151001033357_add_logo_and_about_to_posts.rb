class AddLogoAndAboutToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :logo, :string
    add_column :posts, :about, :string
  end
end
