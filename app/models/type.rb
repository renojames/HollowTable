class Type < ActiveRecord::Base

  has_many :games, through: :game_types

end