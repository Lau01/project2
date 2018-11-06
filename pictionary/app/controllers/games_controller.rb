class GamesController < ApplicationController

  def new
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
    @game = Game.find params[:id]
  end

  def play
    @game = Game.find params[:id]
  end

  def result
    @game = Game.find params[:id]
  end

end
