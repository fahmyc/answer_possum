class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :student_id
      t.integer :tutor_id
      t.text :content

      t.timestamps
    end
    add_index :bookings, [:student_id, :tutor_id]
  end
end
