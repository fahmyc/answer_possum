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

def read_comment
  answer = Answer.find(params[:answer_id])
  tutor = Tutor.find(params[:tutor_id])

  comments = Comment.find(:all, :conditions => {:answer_id => params[:answer_id], :read => ['f', nil], :tutor_id => params[:tutor_id], :student_sent => 'f' })
  for comment in comments
    comment.update_attributes(read: true)
  end
  redirect_to :back
end

def tutor_side_unread_comments
  answer = Answer.find(params[:answer_id])
  question = Question.find(params[:question_id])

comments = Comment.find(:all, :conditions => {:answer_id => params[:answer_id], :read => 't', :student_sent => 't' })
  for comment in comments
    comment.update_attributes(read: false)
  end
  redirect_to tutors_answers_path(question.courses, current_tutor)
end

def student_side_unread_comments
  answer = Answer.find(params[:answer_id])
  question = Question.find(params[:question_id])

comments = Comment.find(:all, :conditions => {:answer_id => params[:answer_id], :read => 't', :student_sent => 'f' })
  for comment in comments
    comment.update_attributes(read: false)
  end
  redirect_to :back
end


  private
    def correct_tutor
      @tutor = Tutor.find(params[:tutor_id])
      redirect_to(tutor_path(current_tutor)) unless current_tutor?(@tutor)
    end
end
