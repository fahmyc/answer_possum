module RatingsHelper  
   
  def tutor_rating(tutor_id, rating)
    tutor = Tutor.find_by_id(tutor_id)
    current_rating = tutor.rating
    new_rating = rating + current_rating
    tutor.update_attributes(rating: new_rating)
  end

end