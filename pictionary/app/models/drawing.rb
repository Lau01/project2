class Drawing < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :word, optional: true  
end
