class Comment < ActiveRecord::Base
  attr_accessible :answer_id, :content, :student_id, :tutor_id, :student_sent, :read

  belongs_to :students
  belongs_to :tutors
  belongs_to :answers
  
  default_scope order: 'comments.created_at ASC'


before_save :default_unread

  def default_unread
    self.read ||= "f"
  end
end
