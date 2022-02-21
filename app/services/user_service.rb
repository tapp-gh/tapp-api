
class UserService
  def initialize(user)
    @user = user
  end

  def generate_token
    payload = {"user_id": @user.id}
    return JsonWebToken.encode(payload)
  end

  def generate_token_and_details
    {
      user: UserRepresenter.new(@user).as_json,
      token: generate_token
    }
  end

end