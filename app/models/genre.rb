class Genre < ActiveRecord::Base

  has_many :games, through: :game_genres

end