class Game < ApplicationRecord
  belongs_to :drawer, class_name: 'User', foreign_key: 'drawer_id', optional: true
  belongs_to :guesser, class_name: 'User', foreign_key: 'guesser_id', optional: true
  belongs_to :word, optional: true


  enum status: ['waiting', 'playing', 'finished', 'cancelled']

  def get_role(user)
    # Catch users not logged in and games without a drawer
    return nil unless user && drawer

    return user == self.drawer ? 'drawer' : 'guesser'
  end
end
