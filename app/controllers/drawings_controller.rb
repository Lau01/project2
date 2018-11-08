class DrawingsController < ApplicationController
  before_action :fetch_word, only: [:start]

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
    @current_word = @word
  end

  def draw
    @word = Word.find params[:id]
  end

  private
  def fetch_word
    @word = Word.all.sample
  end

end
