class StaticPagesController < ApplicationController
  def home
    @question = current_student.questions.build if student_signed_in?

    if student_signed_in?
    	redirect_to student_path(current_student)
    end

    if tutor_signed_in?
    	redirect_to tutor_path(current_tutor)
    end
    
  end

  def contact
  end

  def faq
  end

  def signup
  end
end