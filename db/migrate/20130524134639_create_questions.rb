class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :student_id

      t.timestamps
    end
    add_index :questions, [:student_id, :created_at]  #:courses
  end
end
