class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :question_id
      t.integer :tutor_id

      t.timestamps
    end
    add_index :answers, [:tutor_id, :created_at, :question_id]
  end
end
