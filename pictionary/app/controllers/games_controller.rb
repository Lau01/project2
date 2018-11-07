class GamesController < ApplicationController

  before_action :fetch_user

  def home
    render :home
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
      # If the last game is waiting for a guesser, we become that guesser, and redirect to the play action.
      # (the play action will load the guesser template for this user, and the template will send a
      # websockets message to the server when it is ready to start the game, i.e. as soon as the websocket
      # connection is ready)
      # When that message is received in games_channel.rb, it updates the status for this game to 'playing'
      last_game.update guesser: @current_user

      redirect_to game_play_path(last_game.id)
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
      redirect_to game_play_path(game.id)
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

    @role = @game.get_role(@current_user)
    render "#{@role}_play"
  end

  def over
    # raise 'hell'
    puts (params[:drawingData])
    render json: {status: 'ok'}

    @game = Game.find params[:id]

    response = Cloudinary::Uploader.upload(params[:drawingData])
    @game.image = response["public_id"]
    @game.save
  end

  def result
    @game = Game.find params[:id]
  end

  def show
  end

  private
  def broadcast(last_game)
    ActionCable.server.broadcast 'games',
      status: last_game.status
    head :ok
  end
end
