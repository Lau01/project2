class GamesController < ApplicationController

  def new

    if @current_user.present?

      @game = Game.get_waiting_game

      if @game && (@current_user.id != @game.drawer_id)
        @game.guesser_id = @current_user.id
      else
        @game = Game.new
        @game.drawer_id = @current_user.id
        @game.status = 'waiting'
      end
      @game.save
    end
  end

  def show
  end

  def create
  end

  def update
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
