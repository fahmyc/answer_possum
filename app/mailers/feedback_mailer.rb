class FeedbackMailer < ActionMailer::Base
  default :from => 'answerpossum.feedback@gmail.com'

  def feedback(feedback)
    @feedback = feedback
    mail(:to => 'answerpossum@gmail.com', :subject => '[Feedback for YourSite] #{feedback.subject}')
  end
end
