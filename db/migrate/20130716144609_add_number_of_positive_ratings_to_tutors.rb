class AddNumberOfPositiveRatingsToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :number_of_positive_ratings, :integer
  end
end
