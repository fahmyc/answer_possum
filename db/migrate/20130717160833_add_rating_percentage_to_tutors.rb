class AddRatingPercentageToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :rating_percentage, :decimal
  end
end
