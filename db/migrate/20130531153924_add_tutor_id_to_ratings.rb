class AddTutorIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :tutor_id, :integer
  end
end
