# Application Controller
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include Authorization
  serialization_scope @current_user
end
