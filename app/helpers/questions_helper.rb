module QuestionsHelper  
 
  def current_question=(question)
    @current_question = question
  end

  def current_question
  	@current_question ||= Question.find_by_remember_token(cookies[:remember_token])
  end

  def current_question?(question)
    question == current_question
  end

end