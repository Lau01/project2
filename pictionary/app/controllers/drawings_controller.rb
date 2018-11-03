class DrawingsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def destroy
  end

  def start
    @word = Word.all.sample
  end

  def draw
  end
end
