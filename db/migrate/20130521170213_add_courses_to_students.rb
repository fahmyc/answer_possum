class AddCoursesToStudents < ActiveRecord::Migration
  def change
    add_column :students, :courses, :text
  end
end
