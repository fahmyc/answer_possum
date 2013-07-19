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
  end

  def show
    @questions = Question.find(:all, :conditions => { :courses => params[:id], :open => ['t', nil] }) 
    #@questions = Question.find(:all, :conditions => ['courses = ?', params[:id]] )
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

    @comment = current_student.comments.build if student_signed_in?

    #for answer in @answers_to_question
     # tutorid = answer.tutor_id
      #tutor = Tutor.find_by_id(tutorid)
      #answerid = answer.id

   #   @answer_content = answer.content
      #@tutor = tutor
     # @answer_created_at = answer.created_at
     # @answer = answer

    #end

    #id = params[:answer][:answer_id]
    #answer = Answer.find(id)
    #@follow_up_question = answer.follow_up_questions.build if student_signed_in?
  end

  def update
    @question = Question.find_by_id(params[:id])  
    @question.open = false
    @question.update_attributes({:open => false})
    redirect_to :back
  end



 # def rating
  #  value = params[:type] = "up" ? 1 : -1
   # @answer = Answer.find(:all, :conditions => ['question_id = ?', params[:id]] )
    #@answer.add_evaluation(:rating, value, current_student) 
    #redirect_to :back, notice: "Thank you for rating this answer"
 # end

end

