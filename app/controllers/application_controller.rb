class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  attr_reader :current_identity

  protected

    # Used as a before-filter.
    def authenticate_request!
      unless identity_id_in_token?
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
        return
      end

      @current_identity = Identity.find(auth_token[:identity_id])

    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

  private

    def identity_id_in_token?
      http_token && auth_token && auth_token[:identity_id].present?
    end

    def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end

    def auth_token
      @auth_token ||= JsonWebToken.decode(http_token)
    end
end
