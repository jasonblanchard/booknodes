class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :check_email_param, :only => [:add_email]

end
