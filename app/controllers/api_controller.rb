class ApiController < ApplicationController

  before_action :authentication_token!

  private

  def authentication_token!
      payload = JsonWebToken.decode(auth_token)
      if payload.present?
          @current_user = User.find(payload["sub"])
      end

  rescue JWT::DecodeError
      render json: {error: ["Invalid auth token"]}, status: :unauthorized
  rescue JWT::ExpiredSignature
      render json: {error: ["Auth token has expired"]}, status: :unauthorized
  end


  def auth_token
      @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
  end

end