class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_new_application
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def set_new_application
    @new_application = Application.new
  end
end
