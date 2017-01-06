class AuthenticationsController < ApplicationController

  def create
    identity = Identity.find_for_database_authentication(email: params[:email])

    if identity.valid_password?(params[:password])
      render json: payload(identity)
    else
      render json: { errors: ['Invalid Username/Password'] }, status: :unauthorized
    end
  end

  private def payload(identity)
    return nil unless identity and identity.id

    {
      auth_token: JsonWebToken.encode({ identity_id: identity.id }),
      identity:   { id: identity.id, email: identity.email }
    }
  end
end
