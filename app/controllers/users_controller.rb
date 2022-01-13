class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :authorization_admin, only: [:all, :destroy]

  before_action :authorization_at_least_reg, only: [:edit, :show]

  def index

    redirect_to new_user_path

  end

  def show

    unless user_can_edit(@user)
      redirect_to root_path
    end

  end

  def new

    @user = User.new
    
  end

  def create

    @user = User.new(user_params)
    @user.role = 'registered'

    if @user.save
      session[:user_id] = @user.id
      if session[:game]
        redirect_to game_path
      else
        redirect_to root_path
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
      end
    end

  end

  def edit

    unless user_can_edit(@user)
      redirect_to root_path
    end

  end

  def update
    respond_to do |format|
      if user_can_edit(@user) && @user.update(user_params)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: "L'utilisateur e été mis à jour!" }
      else
        format.html { render :edit }
      end
    end

  end

  def destroy

    respond_to do |format|

      if @user.destroy
        format.html { redirect_to @user, notice: "L'utilisateur a été supprimé !" }

      else
        format.html { redirect_to @user, notice: "L'utilisateur n'a pas pu être supprimé !" }

      end

    end

  end

  def all
    @users = User.all.page(params[:page])
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:avatar, :name, :last_name, :username, :email, :password)
    end

end
