class AddNumberOfRatingsToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :number_of_ratings, :integer
  end
end
