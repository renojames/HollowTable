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

end