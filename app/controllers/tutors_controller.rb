class TutorsController < ApplicationController
	before_filter :student_signed_in?
	before_filter :correct_tutor, only: [:show]


	def show
		@tutors = Tutor.find(params[:id])
    
  #Need to copy and paste this to index view (not the exact same)
  #Also copy and paste this exact to tutor_profile EXCEPT for "tutor" insted of "tutors"
    if @tutors.rating > 30
      @level = "Advanced"
    elsif @tutors.rating  > 10 && @tutors.rating <= 30
      @level = "Novice"
    elsif @tutors.rating <= 10
      @level = "Rookie"
    end

    @total_answers = Answer.find(:all, :conditions => ['tutor_id =?', params[:id]])

	end

	def update
	end

	def index
    	@tutors = Tutor.paginate(page: params[:page])
  end

  def tutor_profile
  	@tutor = Tutor.find_by_id(params[:tutor_id])

    if @tutor.rating.to_f > 30
      @level = "Advanced"
    elsif @tutor.rating.to_f  > 10 && @tutor.rating.to_f <= 30
      @level = "Novice"
    elsif @tutor.rating.to_f <= 10
      @level = "Rookie"
    end

  end



private

    def correct_tutor
      @tutor = Tutor.find(params[:id])
      redirect_to(tutor_path(current_tutor)) unless current_tutor?(@tutor)
    end
    def correct_student
      @student = Student.find(params[:id])
      redirect_to(student_path(current_student)) unless current_student?(@student)
    end

end