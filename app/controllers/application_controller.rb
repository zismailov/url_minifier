class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
