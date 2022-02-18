
class Api::V1::AuthController < ApiController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  skip_before_action :authentication_token!

    def create
      @user = User.find_by_email(params[:email])
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(@user.id)
        render json: {user: UserRepresenter.new(@user).as_json, token: token}, status: :created
      else
        head :unprocessable_entity
      end
    end

  private

  def parameter_missing(e)
    render json: {error: e.message}, status: :unprocessable_entity
  end
end