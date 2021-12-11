class GamesController < ApplicationController

  def index
    @game = Game.new
  end

  def create

  end

  def check_response

  end

  def user_params
    params.require(:user).permit(:response)
  end

end
