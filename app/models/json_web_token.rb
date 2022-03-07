class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base
  ALGORITHM_TYPE = 'HS256'

  def self.encode(user_id)
      payload = {user_id: user_id}
      payload[:exp] = 24.hours.from_now.to_i
      JWT.encode payload, SECRET_KEY, ALGORITHM_TYPE
  end

  def self.decode(token)
      decoded_token = JWT.decode token, SECRET_KEY, true, {algorithm: ALGORITHM_TYPE}
      decoded_token[0]["user_id"]
  end

end

