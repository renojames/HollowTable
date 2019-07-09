class Game < ActiveRecord::Base

  has_many :users, through: :user_games
  has_many :comments
  has_many :genres, through: :game_genres 
  has_many :types, through: :game_types
  belongs_to :publisher

end