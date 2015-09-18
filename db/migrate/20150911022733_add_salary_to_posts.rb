class AddSalaryToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :salary, :string
  end
end
