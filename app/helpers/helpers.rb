class Helpers

  def self.is_logged_in?(session)
    !!session["user_id"]
  end
  
  def self.current_user(session)
    User.find(session["user_id"])
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