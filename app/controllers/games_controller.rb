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
    if !Game.find_by(name: params["name"])
      game = Game.create(name: params["name"], summary: params["summary"], play_time: params["play_time"], max_players: params["max_players"], year_published: params["year_published"])
      if !Publisher.find_by(name: params["publisher"])
        game.publisher = Publisher.create(name: params["publisher"])
      end
      if params["new_genre"] && params["new_genre"] != ""
        genre = Genre.create(name: params["new_genre"])
        game.genres << genre
      end
      params["genres"].each do |genre|
        game.genres << Genre.find(genre)
      end
      if params["new_type"] && params["new_type"] != ""
        type = Type.create(name: params["new_type"])
        game.types << type
      end
      params["types"].each do |type|
        game.types << Type.find(type)
      end
      Helpers.current_user(session).games << game
      redirect '/home'
    else
      redirect '/games/new'
    end
  end

end