AnswerPossum::Application.routes.draw do

  match 'feedbacks' => 'feedbacks#create', :as => :feedback

  match 'feedbacks/new' => 'feedbacks#new', :as => :new_feedback

  devise_for :admins

  devise_for  :tutors

  devise_for  :students


 
  #do
   # get 'inbox', :on => :member
  #end

  resources   :students, :only => [:show]
  resources   :admins
  resources   :tutors
  resources   :questions
  resources   :answers 
  resources   :ratings
  resources   :bookings
  resources   :comments
  resources   :feedback

  #, :controllers => { :sessions => "students/sessions" }

  root to: 'static_pages#home'

  match '/faq',               to: 'static_pages#faq'
  match '/signup',            to: 'static_pages#signup'
  match '/contact',           to: 'static_pages#contact'
  match '/bad',               to: 'static_pages#bad'
  match '/user-feedback',          to: 'feedbacks#feedback_home',  :as => "feedback_home"
  match 'students/:id',       to: 'students#show'
  match 'tutors/:id',         to: 'tutors#show'
  match 'admins/:id',        to: 'admins#show', :as => "admin_show"
  match 'questions/:courses', to: 'questions#show', :as => "questions_courses", :via => "get"
  match 'students/:id/inbox', to: 'students#inbox', :as => "students_inbox",    :via => "get" #
  match 'questions/qna/:id/:student_id', to: 'questions#qna', :as => "questions_qna"#,    :via => "get"
  match 'bookings/:student_id/:tutor_id', to:'bookings#booking', :as =>"bookings_booking", :via => "get"
  match 'tutors/profile/:tutor_id',    to: 'tutors#tutor_profile',  :as => "tutors_profile", :via => "get"
  match 'answers/:courses/:tutor_id',   to: 'answers#answer_page',    :as => "tutors_answers", :via =>"get"
  match 'answers/:id/:tutor_id/:question_id',     to: 'answers#specific_answer_page', :as => "specific_answer"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
