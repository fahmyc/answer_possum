class StudentsController < ApplicationController
	before_filter :student_signed_in?
	before_filter :correct_student

	def show
		@students = Student.find(params[:id])
   		@questions = @students.questions.paginate(page: params[:page])
    	@question = current_student.questions.build if student_signed_in?
    	@courses = current_student.courses
	end

	def inbox
		@students = Student.find(params[:id])
		@questions = @students.questions
	end
	
	  private

    def correct_student
      @student = Student.find(params[:id])
      redirect_to(student_path(current_student)) unless current_student?(@student)
    end

end

