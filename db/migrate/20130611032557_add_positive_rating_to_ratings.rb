class AddPositiveRatingToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :positive_rating, :boolean
  end
end
