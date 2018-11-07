class GamesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'games'
  end

  def unsubscribed
  end

  # Listen for messages sent from the frontend (in JS)
  def guesser_ready(data)
    # This SHOULD find the right game (TODO: pass game ID from frontend instead?)
    game = Game.where(guesser: current_user, status: 'waiting').last
    puts "GUESSER JOINING GAME:"
    p game
    game.update status: 'playing'

    ## ActionCable will broadcast to the games channel when the game's status is updated
    ActionCable.server.broadcast 'games', status: 'playing'
  end

  def drawer_clicked(data)
    puts '++++++++++++++++++++++'
    puts data
    puts '++++++++++++++++++++++'

    # ActionCable.server.broadcast 'games', status: 'playing'
  end
end
