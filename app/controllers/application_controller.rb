class ApplicationController < ActionController::Base

  helper_method :current_user_role

  def current_user_role
    if logged_in?
      @current_user_role = User.find(session[:user_id]).role
    else
      @current_user_role = 'anonymous'
    end
  end

  def logged_in?
    session[:user_id].present?
  end

end
