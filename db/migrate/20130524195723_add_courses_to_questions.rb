class AddCoursesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :courses, :string
  end
end
