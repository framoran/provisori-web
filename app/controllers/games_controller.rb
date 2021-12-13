class GamesController < ApplicationController

  before_action :authorization_admin, only: [ :new, :create, :edit, :update, :destroy]

  def index

    @enigme = Game.last
    @game = Game.new

    @users_found = User.count(:response_game)

    if session[:user_id].present?

      user = User.find(session[:user_id])
      @has_found = user.response_game

    else

      @has_found = false

    end

  end

  def new

    @game = Game.new

  end

  def create

    @game = Game.new(game_params)
    @game.type_of_question = 1

    respond_to do |format|
      if @game.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @game, notice: 'La question a bien été créée.' }
      else
        format.html { render :new }
      end
    end


  end

  def edit

    @game = Game.last

  end

  def update

    game = Game.last
    game.update(game_params)

    redirect_to game_path

  end

  def destroy

  end

  def check_response

    @game = Game.new
    response = Game.last

    respond_to do |format|

      unless session[:user_id].present?
        return redirect_to @game, notice: "Vous devez être loggué pour pouvoir répondre à l'énigme. <a href='/login'>Se logguer</a>."
      end

      if params[:game][:response].downcase == response.response.downcase
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

  def winner

    @game = Game.last
    year = Time.now.strftime("%Y").to_i
    week = Time.now.strftime("%U").to_i
    user = User.where("response_game = true").order("RANDOM()").first

    winner = Winner.new

    winner.year = year
    winner.week = week
    winner.user_id = user.id
    winner.game_id = @game

    winner.save!

    redirect_to games_path

  end

  def game_params
    params.require(:game).permit(:question, :response)
  end

end
