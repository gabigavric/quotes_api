class ApplicationController < ActionController::API
  include Response

  # include Response
  # include ExceptionHandler

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

  

end
