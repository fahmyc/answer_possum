class TutorsController < ApplicationController
	before_filter :student_signed_in?
	before_filter :correct_tutor, only: [:show]

	def show
		@tutors = Tutor.find(params[:id])
	end

	def update
	end

	def index
    	@tutors = Tutor.paginate(page: params[:page])
  	end

  	def tutor_profile
  		@tutor = Tutor.find_by_id(params[:tutor_id])
  	end

private

    def correct_tutor
      @tutor = Tutor.find(params[:id])
      redirect_to(tutor_path(current_tutor)) unless current_tutor?(@tutor)
    end


end