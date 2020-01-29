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

  get '/games/:id' do
    @game = Game.find(params[:id])
    erb :"/games/show"
  end

  post '/games' do
    if !Game.find_by(name: params["name"])
      game = Game.create(name: params["name"], summary: params["summary"], play_time: params["play_time"], max_players: params["max_players"], year_published: params["year_published"])

      if !!params["publisher_id"] && params["publisher_id"] != ""
        game.publisher = Publisher.find(params["publisher_id"])
      end

      if !Publisher.find_by(name: params["new_publisher"].strip!) && params["new_publisher"] != ""
        game.publisher = Publisher.create(name: params["new_publisher"])
      end

      if !!params["new_genre"] && params["new_genre"] != ""
        genre = Genre.create(name: params["new_genre"])
        game.genres << genre
      end

      if !!params["genres"]
        params["genres"].each do |genre|
          game.genres << Genre.find(genre)
        end
      end

      if !!params["new_type"] && params["new_type"] != ""
        type = Type.create(name: params["new_type"])
        game.types << type
      end

      if !!params["types"]
        params["types"].each do |type|
          game.types << Type.find(type)
        end
      end
      Helpers.current_user(session).games << game
      redirect '/home'
    else
      redirect '/games/new'
    end
  end

  get '/game/:id/edit' do
    @game = Game.find(params[:id])
    erb :"/games/edit"
  end

  patch '/games/:id' do
    @game = Game.find(params[:id])
    
    @game.genres.clear
    @game.types.clear

    @game.update(name: params["name"], summary: params["summary"], play_time: params["play_time"], max_players: params["max_players"], year_published: params["year_published"])

    if !!params["publisher_id"] && params["publisher_id"] != ""
      @game.publisher = Publisher.find(params["publisher_id"])
    end
    if !Publisher.find_by(name: params["new_publisher"].strip!) && params["new_publisher"] != ""
      @game.publisher = Publisher.create(name: params["new_publisher"])
    end
    if !!params["new_genre"] && params["new_genre"] != ""
      @genre = Genre.create(name: params["new_genre"])
      @game.genres << genre
    end
    if !!params["genres"]
      params["genres"].each do |genre|
        @game.genres << Genre.find(genre)
      end
    end
    if !!params["new_type"] && params["new_type"] != ""
      type = Type.create(name: params["new_type"])
      @game.types << type
    end
    if !!params["types"]
      params["types"].each do |type|
        @game.types << Type.find(type)
      end
    end
    erb :'/games/show'
  end

  delete '/game/:id' do
    @game = Game.find(params[:id])
    if Helpers.current_user(session).games.include?(@game)
      Helpers.current_user(session).games.delete(@game)
      redirect to '/games'
    end
    if !Helpers.current_user(session).games.include?(@game)
      Helpers.current_user(session).games << @game
      redirect to '/games'
    end
  end

  post "/games/:id/add_comment" do
    @game = Game.find(params[:id])
    new_comment = Comment.create(content: params["content"])
    @game.comments << new_comment
    Helpers.current_user(session).comments << new_comment
    redirect to "/games/#{@game.id}"
  end

end