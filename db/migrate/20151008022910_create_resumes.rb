class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :attachment
      t.string :letter

      t.timestamps null: false
    end
  end
end
