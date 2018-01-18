class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected

def configure_permitted_parameters
  # Only add some parameters
  devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name]
end

end
