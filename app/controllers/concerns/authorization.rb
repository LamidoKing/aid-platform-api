module Authorization
  def current_user
    if decoded_token
      userId = decoded_token[0]['user_id']
      @current_user = User.find_by(id: userId)
    end
  end

  protected

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      JsonWebToken.decode(token)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
