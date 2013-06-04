class BookingsController < ApplicationController
  before_filter :student_signed_in?

 def booking
 	@tutor = Tutor.find(params[:tutor_id])
 	@student = Student.find(params[:student_id])
   	@booking = @student.bookings.build if student_signed_in?

 end

 def create
 	@tutor = Tutor.find_by_id(params[:booking][:tutor_id])
 	@booking = current_student.bookings.build(params[:booking])
 	@student = Student.find_by_id(params[:booking][:student_id])

 	if @booking.save
 		BookingMailer.tutor_booking_request(@tutor, @student, @booking).deliver

 		flash[:success] = "The booking request has been sent!"
 		redirect_to student_path(current_student)
 	
		student_confirmation = params[:booking][:email_confirmation]
   		if student_confirmation = 1	
   		 	BookingMailer.student_booking_confirmation(@student, @tutor, @booking).deliver
   		end

 	else
 		render 'static_pages/bad'
 	end


 end

end
