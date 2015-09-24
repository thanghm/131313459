class AddFilterToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :address, :string
    add_column :admins, :phone, :integer
  end
end
