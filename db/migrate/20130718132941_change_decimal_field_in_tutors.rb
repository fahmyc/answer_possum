class ChangeDecimalFieldInTutors < ActiveRecord::Migration
  def up
  	change_column :tutors, :rating_percentage, :decimal, :precision => 5, :scale => 2
  end

  def down
  end
end
