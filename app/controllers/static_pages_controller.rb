class StaticPagesController < ApplicationController
  def home
    @question = current_student.questions.build if student_signed_in?
  end

  def contact
  end

  def faq
  end

  def signup
  end
end