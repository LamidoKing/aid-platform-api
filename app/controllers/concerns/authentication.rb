class Authentication
  def initialize(user)
    @email = user[:email]
    @password = user[:password]
    @user = User.find_by_email(@email)
  end

  # check password
  def authenticate
    @user&.authenticate(@password)
  end

  # return user
  def user_data
    @user
  end

  # to genarate Token
  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end
