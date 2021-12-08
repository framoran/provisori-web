class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    @user.role = 'admin'

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      respond_to do |format|
        format.html { render :new }
      end
    end

  end

  def edit

    @user = User.find(session[:user_id])

  end

  def update

    respond_to do |format|
      if user_can_edit(@user) && @user.update(user_params)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end

  end

  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:avatar, :name, :last_name, :email, :password)
  end
end
