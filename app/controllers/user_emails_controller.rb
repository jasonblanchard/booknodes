class UserEmailsController < ApplicationController
  skip_before_filter :check_email_param, :only => [:add_email, :update_email]

  def new_email
  end

  def update_email
    #TODO: Make this work
    @user = User.where(:uid => params[:user][:uid]).first
    if @user.update_attributes(:email => params[:user][:email])
      redirect_to :root
    else
      render :new_email
    end
  end
end
