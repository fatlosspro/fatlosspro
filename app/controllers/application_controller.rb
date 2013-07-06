class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  #before_filter :get_static_pages

  after_filter :set_landing

  def set_landing
    cookies[:landing] = true
  end

  def get_static_pages
    @pages = Page.where(visible: true)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :first_name, :last_name, :bio, :avatar, :cropped, :crop_x, :crop_y, :crop_w, :crop_h) }
  end
end
