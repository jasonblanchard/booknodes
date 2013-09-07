class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_email_param, :if => :user_signed_in?

  private

  def check_email_param
    redirect_to add_email_path if current_user.email.blank?
  end
end
