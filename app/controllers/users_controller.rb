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

    flash[:alert] = nil

    @user = User.new(user_params)
    @user.role = 'registered'

    if @user.save
      session[:user_id] = @user.id
      redirect_to show_url
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
      if user_can_edit(@user) && @user.update(user_params_update)
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

      if @user.destroy

        redirect_to '/fr/users_all', notice: "L'utilisateur a été supprimé !"

      else

        redirect_to '/fr/users_all', notice: "L'utilisateur n'a pas pu être supprimé !"

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
    def user_params_update
      params.require(:user).permit(:avatar, :name, :last_name, :email, :password)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:avatar, :name, :last_name, :username, :email, :password)
    end

end
