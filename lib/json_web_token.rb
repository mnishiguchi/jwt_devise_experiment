# Encapsulate the JWT token encoding and decoding logic.
class JsonWebToken

  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    data = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    return HashWithIndifferentAccess.new(data)
  rescue
    nil
  end

end
