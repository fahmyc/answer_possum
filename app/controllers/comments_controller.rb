class CommentsController < ApplicationController
  before_filter :student_signed_in?
  

  def create
		 if current_tutor
  		@comment = current_tutor.comments.build(params[:comment])
        if @comment.save
          flash[:success] = "Comment sent!"
          redirect_to :back
          #redirect_to tutor_path(current_tutor)
        else
          render 'static_pages/bad'
        end
    else
		  @comment = current_student.comments.build(params[:comment])
		  	if @comment.save
		      flash[:success] = "Comment sent!"
			    redirect_to :back
          #redirect_to students_inbox_path(current_student)
		    else
		      render 'static_pages/bad'
    end
  end
end

  private
    def correct_tutor
      @tutor = Tutor.find(params[:tutor_id])
      redirect_to(tutor_path(current_tutor)) unless current_tutor?(@tutor)
    end
end
