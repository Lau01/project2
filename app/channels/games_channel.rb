class GamesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'games'
  end

  def unsubscribed
    ## TO DO
  end

  # Listen for messages sent from the frontend (in JS)
  def guesser_ready(data)
    # This SHOULD find the right game (TODO: pass game ID from frontend instead?)
    game = Game.where(guesser: current_user, status: 'waiting').last
    game.update status: 'playing'

    ## ActionCable will broadcast to the games channel when the game's status is updated
    ActionCable.server.broadcast 'games', status: 'playing'
  end

  def game_over(data)
    ActionCable.server.broadcast 'games', status: 'finished'
  end

  def drawer_clicked(data)
    ActionCable.server.broadcast 'games', event: data['event'], position: {xPos: data['position']['xPos'], yPos: data['position']['yPos']}
  end

  def drawer_entered(data)
    ActionCable.server.broadcast 'games', event: data['event'], position: {xPos: data['position']['xPos'], yPos: data['position']['yPos']}
  end

  def drawer_moved(data)
    ActionCable.server.broadcast 'games', event: data['event'], position: {xPos: data['position']['xPos'], yPos: data['position']['yPos']}, userInput: data['userInput']
  end

  def clear_canvas(data)
      ActionCable.server.broadcast 'games', clear: true
  end
end
