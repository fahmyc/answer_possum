class Question < ActiveRecord::Base
  attr_accessible :content, :courses, :subject, :student_id, :open
  belongs_to :student
  has_many :answers
  

  validates :student_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'questions.created_at DESC'

#  def feed
 # 	Question.where("courses = ?", courses)
  #end
#  before_save :default_open

 # def default_open
 #   self.open? ||= 1
 # end


    private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
