class ApplicationController < ActionController::Base

  include RolesHelper

  before_action :set_locale

  helper_method :current_user_role
  helper_method :current_user
  helper_method :logged_in?

  def authorization_admin
    unless current_user_role == 'admin'
      redirect_to root_path
    end
  end

  def authorization_at_least_reg
    unless current_user_role == 'registered' || current_user_role == 'admin'
      redirect_to root_path
    end
  end

  def current_user
    if logged_in?
      return @current_user = User.find(session[:user_id])
    else
      return false
    end
  end

  def current_user_role
    if logged_in?
      @current_user_role = User.find(session[:user_id]).role
    else
      @current_user_role = 'anonymous'
    end
  end

  def default_url_options
   { locale: I18n.locale }
  end

  def logged_in?
    session[:user_id].present?
  end

  def set_default_session
    session[:url] = 'root'
  end

  def set_locale
    if params[:locale] == 'fr' || params[:locale] == 'en'
      I18n.locale = params[:locale] || I18n.default_locale
    else
      { locale: I18n.locale }
    end
  end

  def set_session_game
    session[:url] = 'game'
  end


  def show_url

    case
    when session[:url] == 'game' then url = game_path
    when session[:url] != 'root' && session[:url].present? then url = session[:url]
    else url = root_path
    end

    return url

  end

end
