module ExceptionHandler
  extend ActiveSupport::Concern
  class DecodeError < StandardError; end
  class ExpiredSignature < StandardError; end
  included do
    rescue_from ExceptionHandler::DecodeError do |_error|
      render json: {
        message: 'Access denied!. Invalid token.'
      }, status: :unauthorized
    end
    rescue_from ExceptionHandler::ExpiredSignature do |_error|
      render json: {
        message: 'Access denied!. Token has expired.'
      }, status: :unauthorized
    end
    rescue_from ActiveRecord::RecordNotFound do |_error|
      render json: {
        message: 'Not Found'
      }, status: :not_found
    end
  end
end
