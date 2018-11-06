# app/channels/games_channel.rb

class GamesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'games'
  end

  def unsubscribed
  end

  # listen for messages sent from the frontend (in JS)
  def guesser_ready(data)
    puts "GOT MESSAGE: 'guesser_ready'"
    puts data
    puts "current_user:", current_user

    # This SHOULD find the right game (TODO: pass game ID from frontend instead?)
    game = Game.where(guesser: current_user, status: 'waiting').last
    game.update status: 'playing'

    ## ActionCable will broadcast to the games channel when the game's status is updated
    ActionCable.server.broadcast 'games', status: 'playing'
  end


  def receive(data)
    puts "GOT A WEBSOCKETS MESSAGE FROM FRONTEND:"
    puts data
  end

end
