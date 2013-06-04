class ApplicationController < ActionController::Base
  protect_from_forgery

   	def after_sign_in_path_for(resource)
    	if resource.is_a?(Student)
    		student_path(current_student)
    	elsif resource.is_a?(Tutor)
    		tutor_path(current_tutor)
    	else
    		admin_path(current_admin)
    	end
	end

    def current_student?(student)
    	student == current_student
  	end

    def current_tutor?(tutor)
      tutor == current_tutor
    end

end

