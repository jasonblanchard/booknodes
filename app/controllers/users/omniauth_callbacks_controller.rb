class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def goodreads
    puts "=== #{request.env['omniauth.auth']}"
  end
end
