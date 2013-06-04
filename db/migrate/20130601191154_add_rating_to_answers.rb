class AddRatingToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :rating, :integer
    add_index  :answers, :rating
  end
end
