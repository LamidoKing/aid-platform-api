class ApplicationController < ActionController::API
  include ExceptionHandler
  include Authorization
end
