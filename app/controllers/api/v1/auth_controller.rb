
class Api::V1::AuthController < ApiController

  skip_before_action :authentication_token!

    def create
      user = User.find_by(email: params.require(:email))
      p params.require(:password).inspect
      render json: {token: '123'}, status: :created
    end

end