class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create

    user = User.find_by(email: params[:email].downcase)

    if(user.nil? || !user.authenticate(params[:password]))
     flash[:alert] = "Email or password is invalid.  Please try again"
     render 'new'
    else
     session[:user_id] = user.id
     if session[:game]
       redirect_to game_path
     else
       redirect_to root_path
     end
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
