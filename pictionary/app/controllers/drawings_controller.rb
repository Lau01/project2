class DrawingsController < ApplicationController
  def new
    @drawing = Drawing.new
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
    @word = Word.find params[:id]
  end
end
