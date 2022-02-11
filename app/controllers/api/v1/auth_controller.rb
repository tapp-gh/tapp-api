
class Api::V1::AuthController < ApiController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  skip_before_action :authentication_token!

    def create
      if user&.authenticate(params.require(:password))
        token = JsonWebTokenService.encode(user.id)
        render json: {token: token}, status: :created
      else
        head :unauthorized
      end
    end

  private

  def user
    @user ||= User.find_by(email: params.require(:email))
  end


  def parameter_missing(e)
    render json: {error: e.message}, status: :unprocessable_entity
  end
end