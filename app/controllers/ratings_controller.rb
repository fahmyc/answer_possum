class RatingsController < ApplicationController
  before_filter :student_signed_in?

  

  def create
    @rating = current_student.ratings.build(params[:rating])
    if @rating.save
      tutor_id = params[:tutor_id]
      rating = params[:rating]
      view_context.tutor_rating
      tutor_rating(tutor_id, rating)

      view_context.count_tutor_ratings
      count_tutor_ratings(tutor_id)

      #if rating>0
       # @rating.positive_rating == 1
      #end

      #tutor = Tutor.find_by_id(:tutor_id)
      #tutor.update_attributes(rating: :rating)
      #rating = tutor.ratings.sum(:rating)
      #new_rate = tutor.rating.build(:rating)

     # @tutor = Rating.find(:all, :conditions => ['tutor_id = ?', tutorid] )
      #answer_id=@rating.answer_id
   #   answer = Answer.find_by_id(answer_id)
    #  tutor = Tutor.find_by_id(answer.tutor_id)
     # rate = tutor.ratings.build(@rating)
      #rate.save

      flash[:success] = "Thanks for rating this answer!"
      redirect_to students_inbox_path(current_student)
    else
      render 'static_pages/bad'
    end
  end
end