class AdminsController < ApplicationController
  before_filter :admin_signed_in?

  def show
  	@admins = Admin.find(params[:id])
  	@students = Student.all
	@tutors = Tutor.all  	
	@bookings = Booking.all
	@questions = Question.all
	@answers = Answer.all
  end
end