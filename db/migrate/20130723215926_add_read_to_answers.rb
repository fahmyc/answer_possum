class AddReadToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :read, :boolean
  end
end
