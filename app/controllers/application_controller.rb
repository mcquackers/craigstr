class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  before_action :require_login
  before_action :require_admin, only: [:create]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
