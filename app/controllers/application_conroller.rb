class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "password_security"
    end

    get '/' do
        if !Helpers.is_logged_in?(session)
            erb :index
        else
            erb :"/users/home"
        end
    end



end