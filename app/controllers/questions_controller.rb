class QuestionsController < ApplicationController
  before_filter :student_signed_in?

  def create
    @question = current_student.questions.build(params[:question])
    if @question.save
      flash[:success] = "Question sent!"
      redirect_to student_path(current_student)
    else
      render 'static_pages/home'
    end

#    @answer = current_tutor.answers.build(params[:answer])
 #   if @answer.save
  #    flash[:success] = "Answer sent!"
   #   redirect_to tutor_path(current_tutor)
    #else
     # render 'static_pages/home'
   # end
  end

  def show
    @questions = Question.find(:all, :conditions => ['courses = ?', params[:id]] )
    #find(:conditions => ['courses = ?', params[:courses]])
    #find_all_by_courses(params[:courses])
    @subjects = @questions.collect(&:subject)
    @answer = current_tutor.answers.build if tutor_signed_in?
  end

  def destroy
  end

  def qna
    @question = Question.find_by_id(params[:id])
    @answers_to_question = Answer.find(:all, :conditions => ['question_id = ?', params[:id]] )
    @ratings = [-1, 0, 1, 2, 3]
  end

 # def rating
  #  value = params[:type] = "up" ? 1 : -1
   # @answer = Answer.find(:all, :conditions => ['question_id = ?', params[:id]] )
    #@answer.add_evaluation(:rating, value, current_student) 
    #redirect_to :back, notice: "Thank you for rating this answer"
 # end

end