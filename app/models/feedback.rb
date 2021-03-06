class Feedback < ActiveRecord::Base
  attr_accessor :subject, :email, :comment, :page

  validates :subject, :presence => true
  validates :comment, :presence => true

  def initialize(params = {})
    self.subject = params[:subject]
    self.email = params[:email]
    self.comment = params[:comment]
    self.page = params[:page]
  end

  def valid?
    self.comment && !self.comment.strip.blank?
  end

end
