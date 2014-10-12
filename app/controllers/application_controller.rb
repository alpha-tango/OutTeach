class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def authorize!
    if current_user.nil? or !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
