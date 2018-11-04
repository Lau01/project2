class WordsController < ApplicationController
  def index
    @words = Word.all.order(:word)
    @drawings = Drawing.all.sample(4)
  end

  def show
    render json: Word.find(params[:id]).drawings
  end
end
