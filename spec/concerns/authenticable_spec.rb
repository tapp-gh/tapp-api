
require 'rails_helper'

class MockController
  include Authenticable
  attr_accessor :request
  def initialize(user)
    token = UserService.new(user).generate_token
    headers = token
    mock_request = Struct.new(:headers)
    self.request = mock_request.new({'Authorization': headers})
  end
end


describe Authenticable do
  describe '.current_user' do
    before do
      @user = create(:user, is_active: true)
    end
    
    let(:authentication){MockController.new(@user)}
    it 'should get user from authorization token' do
      authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)
      expect(authentication.current_user.id).not_to be_nil
      expect(authentication.current_user.id).to eq(@user.id)
    end

    it 'should not get user from empty authorization token' do
      authentication.request.headers['Authorization'] = nil
      expect(authentication.current_user).to be_nil
    end
  end
end