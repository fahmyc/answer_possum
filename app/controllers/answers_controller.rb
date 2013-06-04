class AnswersController < ApplicationController
  before_filter :tutor_signed_in?
  

  def create
    @answer = current_tutor.answers.build(params[:answer])
    if @answer.save
      flash[:success] = "Answer sent!"
      redirect_to tutor_path(current_tutor)
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


      
      flash[:success] = "Thanks for rating this answer! rating: #{r} tutor id: #{t}"
      redirect_to students_inbox_path(current_student)
    else
      render 'static_pages/bad'
    end
  end

#  def rating
 #   value = params[:type] = "up" ? 1 : -1
  #  @answer = Answer.find(:all, :conditions => ['question_id = ?', params[:id]] )

   #   for answer in @answer
    #    answer.add_evaluation(:rating, value, current_student)
     # end
    #redirect_to :back, notice: "Thank you for rating this answer"   

   #@answer.add_evaluation(:rating, value, current_student) 
    #redirect_to :back, notice: "Thank you for rating this answer" 
  #end

end
