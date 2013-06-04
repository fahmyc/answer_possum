class AddCoursesToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :courses, :text
  end
end
