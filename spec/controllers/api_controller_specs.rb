
require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  let(:user){create(:user)}
  let(:token_new) {UserService.new(user).generate_token}
  let(:token) do
    {  "Authorization": "Bearer #{token_new}"  }
  end

  controller do
    def auth_token
      super
    end

    def authentication_token!
      super
    end

  end

  describe '.authentication_token!' do
    before do
      request.headers.merge! token
    end
    it 'returns current user' do
      puts request.headers['Authorization']
      expect(response).to have_http_status(200)
      expect(controller.authentication_token!).to eq(user)
    end

    it 'returns invalid jwt error' do
      fake_token =  { "Authorization": "Bearer "}
      request.headers.merge! fake_token
      expect(controller.authentication_token!).to_not eq(user)
    end
  
  end

  describe '.auth_token' do
      before do
        request.headers.merge! token
      end
      it "returns auth token" do
        expect(response).to have_http_status(200)
        expect(controller.auth_token).to eq(token_new)
      end
    end
end

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