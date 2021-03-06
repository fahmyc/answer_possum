class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :rating, :student_id, :read
  belongs_to :question
  belongs_to :tutor
  belongs_to :student

 # validates :tutor_id, presence: true
  #validates :question_id, presence: true
  validates :content, presence: true

  has_many :comments
end
