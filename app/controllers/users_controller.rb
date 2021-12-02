class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      format.html { render :new }
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password)
  end
end
