class AddPostIdToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :post_id, :integer
  end
end
