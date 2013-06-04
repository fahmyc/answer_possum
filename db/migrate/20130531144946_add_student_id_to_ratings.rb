class AddStudentIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :student_id, :integer
  end
end
