class GamesController < ApplicationController

  before_action :fetch_user

  def home
    render :home
  end

  def show
  end

  def create
    # Check that the user is logged in
    unless @current_user.present?
      flash[:error] = "Please sign in to continue."
      redirect_to login_path
      return
    end

    # Check if a game is waiting for a guesser,
    # if so update the game's guesser_id and status
    last_game = Game.last

    if last_game.status == 'waiting'
      last_game.update(
        guesser_id: @current_user.id,
        status: 'playing'
      )

      redirect_to play_path(last_game.id)
      return
    end

    # Get a random word for the game
    random_word = Word.all.sample

    # Create the new game
    game = Game.new(
      drawer_id: @current_user.id,
      word_id: random_word.id,
      status: 'waiting'
    )

    if game.save
      ### ACTIONCABLE
      redirect_to wait_path(game.id)
    end

    ### Check that drawer hasn't gone back and created a new game
    #   if @game && (@current_user.id != @game.drawer_id)
    #     @game.guesser_id = @current_user.id
    #   else
    # end

    @game = Game.find params[:id]
  end

  def play
    @game = Game.find params[:id]
  end

  def result
    @game = Game.find params[:id]
  end

end
