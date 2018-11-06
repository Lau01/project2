class Game < ApplicationRecord
  belongs_to :drawer, class_name: 'User', foreign_key: 'drawer_id', optional: true
  belongs_to :guesser, class_name: 'User', foreign_key: 'guesser_id', optional: true
  belongs_to :word, optional: true


  enum status: ['waiting', 'playing', 'finished']

  def self.get_waiting_game
    Game.all.find_by guesser_id: nil, status: 'waiting'
  end

end
