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
		@open_questions = Question.find(:all, :conditions =>{:student_id => params[:id], :open => ['t', nil]})
	end

	def close_all
		@student = Student.find(params[:id])
		@questions_to_close = @student.questions

		for question in @questions_to_close
			if question.open? || question.open.nil?
				question.update_attributes(open: false)
			end
		end

		redirect_to students_inbox_path(current_student)
	end
	
	  private

    def correct_student
      @student = Student.find(params[:id])
      redirect_to(student_path(current_student)) unless current_student?(@student)
    end

end

