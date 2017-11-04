class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :validate_user_logged

  private
  def validate_user_logged
    return if current_user
    flash[:error] = "You are not logged."
    redirect_to auth_login_url
  end

  def current_user
    @current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end
end
