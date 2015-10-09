class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :attchment
      t.string :letter

      t.timestamps null: false
    end
  end
end
