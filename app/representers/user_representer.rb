
class UserRepresenter
  def initialize(user)
    @user = user
  end

  def as_json
    {
      email: user.email,
      name: user.name,
      date_of_birth: user.date_of_birth
    } 
  end

  private

  attr_reader :user


end