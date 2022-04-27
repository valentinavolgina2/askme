class ApplicationController < ActionController::Base
  helper_method :current_user, :user_setting, :navbar_color

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def navbar_color
    @navbar_color = user_setting&.navbar_color || '#370617'
  end

  def user_setting
    @user_settings ||= Setting.find_by(user_id: session[:user_id]) if session[:user_id]
  end
end
