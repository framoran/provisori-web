class GamesController < ApplicationController

  def index

    @enigme = Game.last
    @game = Game.new

    if session[:user_id].present?

      user = User.find(session[:user_id])
      @has_found = user.response_game

    else

      @has_found = false

    end

  end

  def create

    7

  end

  def check_response

    @game = Game.new
    response = Game.last

    respond_to do |format|

      unless session[:user_id].present?
        return redirect_to @game, notice: "Vous devez être loggué pour pouvoir répondre à l'énigme. <a href='/login'>Se logguer</a>."
      end

      if params[:game][:response].downcase == response.response
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        user = User.find(session[:user_id])
        user.response_game = true
        user.save!
        format.html { redirect_to @game, notice: "Félicitations! Vous avez trouvé la bonne réponse !" }
      else
        format.html { redirect_to @game, notice: "Essayez encore !" }
      end

    end

  end

  def game_params
    params.require(:game).permit(:response)
  end

end
