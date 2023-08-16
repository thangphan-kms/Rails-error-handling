module Errors
  module ErrorHandler
    def self.included(base)
      base.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:record_not_found, 404, e.to_s)
        end

        rescue_from StandardError do |e|
          respond(:standard_error, 500, e.to_s)
        end
      end
    end

    private

    def respond(error, status, message)
      render json: {
        error: error,
        status: status,
        message: message
      }, status: status
    end
  end
end
