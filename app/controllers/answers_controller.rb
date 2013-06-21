class AnswersController < ApplicationController
  before_filter :tutor_signed_in?
  before_filter :correct_tutor, only: :answer_page

  def create
    @answer = current_tutor.answers.build(params[:answer])
    if @answer.save
      flash[:success] = "Answer sent!"
      redirect_to :back
    else
      render 'static_pages/bad'
    end
  end

  def update
    @answer = Answer.find_by_id(params[:id])
    #@answer = current_student.answers.update(params[:rating])
    if @answer.update_attributes(rating: params[:answer][:rating], student_id: params[:answer][:student_id])
      r = params[:answer][:rating]
      t = params[:answer][:tutor_id]

      #view_context.tutor_rating
      #tutor_rating(t,r)

    tutor = Tutor.find_by_id(t)
    current_rating = tutor.rating.to_f
    new_rating = r.to_f + current_rating
    tutor.update_attributes(rating: new_rating)

    #zero = 0
     # if r > zero
      #  @answer.update_attributes(positive_rating: 1)
      #end

      flash[:success] = "Thanks for rating this answer!"
      redirect_to students_inbox_path(current_student)
    else
      render 'static_pages/bad'
    end
  end

  def answer_page
    question_from_course = Question.find(:all, :conditions => ['courses =?', params[:courses]])
    questions = question_from_course.collect(&:id)
    @answers = Answer.find(:all, :conditions =>{:tutor_id => params[:tutor_id], :question_id => questions})
    
    correct_question_id = @answers.collect(&:question_id)
    @questions = Question.find(:all, :conditions =>{:id => correct_question_id})
  end

  def specific_answer_page
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @tutor = Tutor.find(params[:tutor_id])
    @comments = Comment.find(:all, :conditions => ['answer_id =?', params[:id]])
    @student = Student.find(@question.student_id)


    #@comment = current_tutor.comments.build if tutor_signed_in?
    @comment = current_tutor.comments.build if tutor_signed_in?

  end
  
private

    def correct_tutor
      @tutor = Tutor.find(params[:tutor_id])
      redirect_to(tutor_path(current_tutor)) unless current_tutor?(@tutor)
    end
    def correct_student
      @student = Student.find(params[:id])
      redirect_to(student_path(current_student)) unless current_student?(@student)
    end

end
