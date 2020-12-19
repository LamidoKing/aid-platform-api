# User Authorization
module Authorization
  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @current_user = begin
                      User.find_by(id: user_id)
                    rescue StandardError
                      ActiveRecord::RecordNotFound
                    end
  end

  protected

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split(' ')[1]
    JsonWebToken.decode(token)
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
