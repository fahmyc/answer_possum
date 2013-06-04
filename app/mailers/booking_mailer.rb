class BookingMailer < ActionMailer::Base
  default from: "answerpossum@gmail.com"

  def student_booking_confirmation(student, tutor, booking)
    @student = student
    @tutor = tutor
    @booking = booking
    mail(:to => "#{student.name} <#{student.email}>", :subject => "Booking request sent")
  end

  def tutor_booking_request(tutor, student, booking)
    @tutor = tutor
    @student = student
    @booking = booking
    mail(:to => tutor.email, :subject => "Booking Request!")
  end

end
