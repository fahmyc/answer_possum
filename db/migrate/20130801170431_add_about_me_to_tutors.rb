class AddAboutMeToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :about_me, :text
  end
end
