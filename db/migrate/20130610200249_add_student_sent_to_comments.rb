class AddStudentSentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :student_sent, :boolean
  end
end
