module RatingsHelper  
   
  def tutor_rating(tutor_id, rating)
    tutor = Tutor.find_by_id(tutor_id)
    current_rating = tutor.rating
    new_rating = rating + current_rating
    tutor.update_attributes(rating: new_rating)
  end

  def count_tutor_ratings(tutor_id)
  	tutor = Tutor.find_by_id(tutor_id)
  	ratings = Rating.find(:all, :conditions => {:tutor_id => tutor.id})
  	number_of_ratings = ratings.count
  	tutor.update_attributes(number_of_ratings: number_of_ratings)
  end
  
end