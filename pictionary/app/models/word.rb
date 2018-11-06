class Word < ApplicationRecord
  has_many :drawings
  has_many :games
end
