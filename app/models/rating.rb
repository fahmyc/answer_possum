class Rating < ActiveRecord::Base
  attr_accessible :answer_id, :rating, :tutor_id

  belongs_to :answer
  belongs_to :student
  belongs_to :tutor

#   def tutor_rating(tutor_id, rating)
 #   tutor = Tutor.find_by_id(tutor_id)
  #  current_rating = tutor.rating
   # new_rating = rating + current_rating
    #tutor.update_attributes(rating: new_rating)
   # current_rating == new_rating

    #rating = tutor.ratings.sum(rating)
    #new_rate = tutor.rating.build(:rating)
 # end

end
