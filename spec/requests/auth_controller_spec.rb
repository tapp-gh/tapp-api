require 'rails_helper'

RSpec.describe 'AuthController', type: :request do
  describe 'POST /auth' do
    let(:user){create(:user)}
    
    it 'authenticates user' do
      post '/api/v1/auth', params: {auth: {email: user.email, password: user.password}}
      token = JSON.parse(response.body)['token']
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({
        'user' => {
          'date_of_birth' => user.date_of_birth,
          'email' => user.email,
          'name' => user.name
        },
        'token' => token
      })
    end

    it 'returns an error when email is missing' do
      post '/api/v1/auth', params: {password: user.password} 
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: auth"
      })
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error when password is missing' do
      post '/api/v1/auth', params: {email: user.email}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        "error" => "param is missing or the value is empty: auth"
      })
    end

    it 'returns an error when password is incorrect' do
      post '/api/v1/auth', params: {auth: {email: user.email, password: 'wrong'}}
      expect(response).to have_http_status(:unauthorized)
    end

  end
end