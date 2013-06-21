class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :courses, :name
  # attr_accessible :title, :body

  serialize :courses

  has_many :questions, dependent: :destroy
  has_many :ratings
  has_many :answers
  has_many :bookings
  has_many :comments

before_save :clear_empty_courses

  def clear_empty_courses
    self.courses.reject!{|x| x==''}
  end

end
