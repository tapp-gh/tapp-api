
class Api::V1::UsersController < ApiController
  skip_before_action :authentication_token!

  def create
    @user = User.new(user_params)
    if @user.save
      user_service = UserService.new(@user)
      response.set_header('Authorization: Bearer', user_service.generate_token)
      render json: user_service.generate_token_and_details, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end

  end


  private

  def user_params
    params.permit(:name, :email, :date_of_birth, :password, :password_confirmation)
  end

end