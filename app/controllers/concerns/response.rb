require 'active_support/concern'

 module Response
  extend ActiveSupport::Concern

    def json_response(object, status = :ok)
      render json: object, status: status
    end

    included do

      rescue_from ActiveRecord::RecordNotFound do |exception|
        json_response({ message: exception.message }, :not_found)
      end

      rescue_from ActiveRecord::RecordInvalid do |exception|
        json_response({ message: exception.message }, :unprocessable_entity)
      end
    end
end
