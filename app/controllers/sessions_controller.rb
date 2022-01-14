class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create

    user = User.find_by(email: params[:email].downcase)

    if(user.nil? || !user.authenticate(params[:password]))

      if I18n.locale == :fr
        flash[:alert] = "Email ou mot de passe non valide."
      else
        flash[:alert] = "Email or password is invalid.  Please try again"
      end

     render 'new'
    else

     flash[:alert] = nil

     session[:user_id] = user.id

     redirect_to show_url

    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
