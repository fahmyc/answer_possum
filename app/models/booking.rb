class Booking < ActiveRecord::Base
  attr_accessible :content, :student_id, :tutor_id, :email_confirmation

  belongs_to :students
  belongs_to :tutors
end
