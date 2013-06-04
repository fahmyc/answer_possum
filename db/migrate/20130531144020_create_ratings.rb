class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :answer_id
      t.integer :rating

      t.timestamps
    end
    add_index :ratings, [:answer_id, :rating, :student_id]
  end
end
