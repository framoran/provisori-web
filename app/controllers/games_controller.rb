class GamesController < ApplicationController

  before_action :authorization_admin, only: [ :new, :create, :edit, :update, :destroy, :winner]

  before_action :set_session_game

  def index

    @enigme = Game.last
    @game = Game.new
    winner = Winner.last

    if winner.present?
      @winner = User.find(Winner.last.user_id)
    end

    # how many users got the correct response
    @users_found = User.where(response_game: true).count

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
    @game.is_display = true

    User.update_all(response_game: false)
    User.update_all(nb_attempts: 0)

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

    # security => if the game is displaying the winner, it's not possible to answer the question
    unless response.is_display == true
      return redirect_to games_path
    end

    respond_to do |format|

      unless session[:user_id].present?
          return redirect_to @game, notice: "#{I18n.translate('error_game')} <a href='/fr/login'>#{I18n.translate('login')}</a>"
      end

      user = User.find(session[:user_id])
      user.nb_attempts = user.nb_attempts + 1
      user.save!(:validate => false)

      # Security => check the number of attempts to prevent from injecting a library programmatically
      unless user.nb_attempts < 500
        return redirect_to @game, notice: "Vous avez dépassé le nombre d'essai autorisé (500) pour répondre à l'énigme."
      end

      # check if correct response to the game
      if params[:game][:response].downcase.include? response.response.downcase
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        user.response_game = true
        user.save!(:validate => false)
        if I18n.locale == :fr
          format.html { redirect_to @game, notice: "Félicitations! Vous avez trouvé la bonne réponse !" }
        else
          format.html { redirect_to @game, notice: "Congratulation! You have found the right answer!" }
        end
      else
        if I18n.locale == :fr
          format.html { redirect_to @game, notice: "Essayez encore !" }
        else
          format.html { redirect_to @game, notice: "Try again !" }
        end
      end

    end

  end

  def winner

    winner_count = User.where(response_game: true).count

    # if there is at least a winner
    unless winner_count >= 1
      flash[:alert] = "Tirage au sort non possible. Aucun utilisateur n'a trouvé la bonne réponse!"
      return redirect_to games_path, error: 1
    end

    game = Game.last
    game.is_display = false
    user = User.where("response_game = true").order("RANDOM()").first

    winner = Winner.new

    winner.year = Time.now.strftime("%Y").to_i
    winner.week = Time.now.strftime("%U").to_i
    winner.user_id = user.id
    winner.game_id = game.id

    respond_to do |format|
      if winner.save! && game.save!
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to games_path, notice: 'Tirage au sort réussi.' }

      else

        format.html { redirect_to games_path, notice: 'Erreur inconnue.' }

      end

    end

  end

  private

  def game_params
    params.require(:game).permit(:question, :response)
  end

end
