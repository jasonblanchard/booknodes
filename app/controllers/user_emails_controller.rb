class UserEmailsController < ApplicationController
  skip_before_filter :check_email_param, :only => [:new_email, :update_email]

  def new_email
    @user = current_user
  end

  def update_email
    @user = current_user
    if current_user.update_attributes(:email => params[:user][:email])
      flash[:notice] = 'Got it!'
      redirect_to :root
    else
      flash[:notice] = "Oops, try again"
      render :action => :new_email
    end
  end
end
