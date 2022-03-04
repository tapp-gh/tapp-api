
class Api::V1::AuthController < ApiController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  skip_before_action :authentication_token!

    def create
      @user = User.find_by_email(user_params['email'])
      if @user&.authenticate(user_params['password'])
        token = JsonWebToken.encode(@user.id)
        response.set_header('Authorization: Bearer', token)
        render json: {user: UserRepresenter.new(@user).as_json, token: token}, status: :ok
      else
        head :unauthorized
      end
    end

  private

  def parameter_missing(e)
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def user_params
    params.require(:auth).permit(:email, :password)
  end
end