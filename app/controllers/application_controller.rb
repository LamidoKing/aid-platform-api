class ApplicationController < ActionController::API
  include ExceptionHandler
  include Authorization
  serialization_scope @current_user
end
