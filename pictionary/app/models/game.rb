class Game < ApplicationRecord
  belongs_to :drawer, class_name: 'User', foreign_key: 'drawer_id', optional: true
  belongs_to :guesser, class_name: 'User', foreign_key: 'guesser_id', optional: true
  belongs_to :word, optional: true

  enum status: ['waiting', 'playing', 'finished']

  # def is_drawer?

  def get_role(user)
    puts "get_role:"
    puts "user:", user
    puts "drawer:", drawer
    return nil unless user && drawer  # error case, one role (ID) is missing

    return user == drawer ? 'drawer' : 'guesser'
  end

  def self.get_waiting_game
    Game.all.find_by guesser_id: nil, status: 'waiting'
  end

  def self.is_game_ready
    Game.where(drawer_id: nil).exists?.or(Game.where(guesser_id: nil).exists?)
  end



end
