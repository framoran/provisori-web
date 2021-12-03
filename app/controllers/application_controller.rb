class ApplicationController < ActionController::Base

  helper_method :current_user_role

  def authorization_admin
    unless current_user_role == 'admin'
      redirect_to root_path
    end
  end

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
