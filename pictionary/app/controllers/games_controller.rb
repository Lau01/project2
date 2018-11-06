class GamesController < ApplicationController

  before_action :fetch_user

  def home
    render :home
  end

  def show
  end

  def create
    # Check that the user is logged in
    ### Add error message
    unless @current_user.present?
      redirect_to login_path
      return
    end

    # Check if a game is waiting for a guesser, and if so redirect to the update action
    last_game = Game.last

    unless last_game.guesser_id.present?
      ### WON'T REDIRECT TO CORRECT ACTION
      redirect_to action: 'update', method: 'PUT', id: last_game.id
      return
    end

    # Get a random word for the game
    random_word = Word.all.sample

    game = Game.new(
      drawer_id: @current_user.id,
      word_id: random_word.id,
      status: 'waiting'
    )
    puts "++++++++++++++++++++++++++++++++++"
    puts game
    puts "++++++++++++++++++++++++++++++++++"

    if game.save
      ### ACTIONCABLE
    end

    ### Check that drawer hasn't gone back and created a new game
    #   if @game && (@current_user.id != @game.drawer_id)
    #     @game.guesser_id = @current_user.id
    #   else
  end

  def update
    raise 'hell'
  end

  def wait

  end

  def ready
    @word = Word.all.sample
    @game = Game.find params[:id]
  end

  def play
    @game = Word.find params [:game_id]
    @word = Word.find params[:word_id]
  end

  def result
  end

end
