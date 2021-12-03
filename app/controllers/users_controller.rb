class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    @user.role = 'registered'

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      respond_to do |format|
        format.html { render :new }
      end
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password)
  end
end
