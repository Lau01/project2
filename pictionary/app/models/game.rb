class Game < ApplicationRecord
  belongs_to :drawer, class_name: 'User', foreign_key: 'drawer_id'
  belongs_to :guesser, class_name: 'User', foreign_key: 'guesser_id'

  enum staus: ['waiting', 'playing', 'finished']
end
