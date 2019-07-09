class User < ActiveRecord::Base

  has_secure_password

  has_many :games, through: :user_games
  has_many :comments 

end