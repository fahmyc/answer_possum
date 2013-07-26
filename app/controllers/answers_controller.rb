class AnswersController < ApplicationController
  before_filter :tutor_signed_in?
  before_filter :correct_tutor, only: [:answer_page, :specific_answer_page]
 # before_filter :correct_tutor2, only: [:specific_answer_page]

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

    #Sum of rating
    tutor = Tutor.find_by_id(t)
    current_rating = tutor.rating.to_f
    new_rating = r.to_f + current_rating
    tutor.update_attributes(rating: new_rating)

    #update nuber of ratings
    current_number_of_ratings = tutor.number_of_ratings.to_f + 1
    tutor.update_attributes(number_of_ratings: current_number_of_ratings)

    #update positive ratings
    if (r.to_f >= 1)
      current_number_of_positive_ratings = tutor.number_of_positive_ratings.to_f + 1
      tutor.update_attributes(number_of_positive_ratings: current_number_of_positive_ratings)
    end

    #update rating percentage
    if (r.to_f >= 1)
      current_rating_percentage = current_number_of_positive_ratings/current_number_of_ratings
      tutor.update_attributes(rating_percentage: current_rating_percentage)
    else
      current_rating_percentage = tutor.number_of_positive_ratings/current_number_of_ratings
      tutor.update_attributes(rating_percentage: current_rating_percentage)
    end

      flash[:success] = "Thanks for rating this answer!"
      redirect_to :back
      #redirect_to students_inbox_path(current_student)
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

    @read_student_comments = Comment.find(:all, :conditions =>{:answer_id => params[:id], :student_sent =>'t', :read => ['t']})

    @unread_student_comments = Comment.find(:all, :conditions =>{:answer_id => params[:id], :student_sent =>'t', :read => ['f', nil]})
    for comment in @unread_student_comments
    comment.update_attributes(read: true)
  end

    #@comment = current_tutor.comments.build if tutor_signed_in?
    @comment = current_tutor.comments.build if tutor_signed_in?
  end

def unread_comment
  
end
  
private

    def correct_tutor
      @tutor = Tutor.find(params[:tutor_id])
      redirect_to(tutor_path(current_tutor)) unless current_tutor?(@tutor)
    end

    def correct_tutor2
      answer = Answer.find(:all, :conditions=> ['tutor_id =?', params[:tutor_id]])
      answer_ids = answer.collect(&:id)

#need to re-write this, find out if you can say "if just ONE of the answer id's is correct, do NOT redirect to tutor_path"
      answer_ids.each do |x|
        if x != params[:id]
          redirect_to(tutor_path(current_tutor))
        end
      end
    end

    def correct_student
      @student = Student.find(params[:id])
      redirect_to(student_path(current_student)) unless current_student?(@student)
    end

end
