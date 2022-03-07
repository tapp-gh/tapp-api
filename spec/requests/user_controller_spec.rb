require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'POST /users' do
    it "creates a new user" do
      expect{
        post '/api/v1/users', params: {name: 'Emmanuel', email: 'emma@gmail.com', date_of_birth: '18/02/2022', password: '12345', password_confirmation: '12345', is_active: true}
      }.to change {User.count}.by(1)
      expect(response).to have_http_status(:created)
    end

    it "shows user creation error" do
      post '/api/v1/users', params: {}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end