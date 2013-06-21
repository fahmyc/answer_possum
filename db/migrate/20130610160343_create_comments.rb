class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :answer_id
      t.integer :tutor_id
      t.integer :student_id
      t.text :content

      t.timestamps
    end
    add_index :comments, [:student_id, :tutor_id, :answer_id]
  end
end
