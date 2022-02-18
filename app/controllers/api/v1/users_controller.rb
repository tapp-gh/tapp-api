class Api::V1::UsersController < ApiController
  skip_before_action :authentication_token!

  def create
    @user = User.new(user_params)
    if @user.save
      payload = {"user_id": @user.id}
      token = JsonWebToken.encode(payload)
      render json: {user: UserRepresenter.new(@user).as_json, token: token}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end

  end


  private

  def user_params
    params.permit(:name, :email, :date_of_birth, :password, :password_confirmation)
  end

end