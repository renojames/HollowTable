class UsersController < ApplicationController

  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/users/home'
    else
      erb :"/users/signup"
    end
  end

end