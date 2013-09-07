class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def goodreads
    puts "===#{request.env['omniauth.auth']}"

    @user = User.find_for_goodreads_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Goodreads") if is_navigational_format?
    else
      session["devise.goodreads_data"] = { 'provider' => 'goodreads', 'uid' => request.env['omniauth.auth']['uid'] }
      redirect_to new_user_registration_url
    end
  end
end
