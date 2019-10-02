class GamesController < ApplicationController

  # TO DO: Build out C.R.U.D for games. Do publishers, types, and genres need their own controllers, 
  # or just built-in validation?

  get '/games' do
    if Helpers.is_logged_in?(session)
      erb :"/games/games"
    else
      redirect '/'
    end
  end

  get '/games/new' do
    if Helpers.is_logged_in?(session)
      erb :"/games/create"
    else
      redirect '/'
    end
  end

  post '/games' do
    binding.pry
    if !Game.find_by(name: params["name"])
      game = Game.create(name: params["name"], summary: params["summary"], play_time: params["play_time"], max_players: params["max_players"], year_published: params["year_published"])
      if !Publisher.find_by(name: params["publisher"])
        game.publisher = Publisher.create(name: params["publisher"])
      end
      game.genres
      Helpers.current_user(session).games << game
      redirect '/home'
    else
      redirect '/games/new'
    end
  end

end