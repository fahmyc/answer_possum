class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :rating, :email, :password, :password_confirmation, :remember_me, :courses, :name, :number_of_ratings, :number_of_positive_ratings, :rating_percentage, :about_me
  # attr_accessible :title, :body

  serialize :courses

  has_many :answers, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :bookings
  has_many :comments

#  def self.tutor_rating(tutor_id)
 #   tutor = Tutor.find_by_id(tutor_id)
  #  rating = tutor.ratings.sum(:rating)
   # new_rate = tutor.rating.build(:rating)
  #end

  before_save :default_rating, :clear_empty_courses

  def default_rating
    self.rating ||= 0
  end

  def clear_empty_courses
    self.courses.reject!{|x| x==''}
  end
end
