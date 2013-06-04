class AddRatingToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :rating, :integer
    add_index  :tutors, :rating
  end
end
