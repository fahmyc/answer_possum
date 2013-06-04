class RegistrationsController < Devise::RegistrationsController


#def new
#	after_update_path_for(current_student)
#end
#
#def edit
#	after_update_path_for(current_student)
#end

  protected

    #def after_sign_up_path_for(current_student)
    #  @students = current_student
    #end

    def after_sign_up_path_for(current_tutor)
     # @tutors = current_tutor
    end

end