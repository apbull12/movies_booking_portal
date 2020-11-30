class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  helper_method :current_admin, :authenticate
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find(session[:admin_id])
    else
      @current_admin = nil
    end
  end

  def authenticate
    redirect_to '/login' unless current_admin.present?
  end
end
