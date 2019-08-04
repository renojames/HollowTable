class UsersController < ApplicationController

  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/users/home'
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
    if entered_username? && entered_email? && entered_password?
      @user = User.create(username: params["username"], email: params["email"], password: params["password"])
      session["user_id"] = @user.id 
      redirect '/home'
    else
      redirect '/signup'
    end
  end

  get '/home' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :"/users/home"
    else
      redirect '/'
    end
  end

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end
  
  
  private

  def entered_username?
    if !!params["username"] && params["username"] != ""
      true
    else
      false
    end
  end

  def entered_email?
    if !!params["email"] && params["email"] != ""
      true
    else
      false
    end
  end

  def entered_password?
    if !!params["password"] && params["password"] != ""
      true
    else
      false
    end
  end

end