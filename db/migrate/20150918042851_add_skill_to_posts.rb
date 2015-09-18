class AddSkillToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :skill, :string
  end
end
