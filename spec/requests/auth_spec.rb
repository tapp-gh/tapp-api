require 'rails_helper'

RSpec.describe 'AuthController', type: :request do
  describe 'POST /auth' do
    let(:user){FactoryBot.create(:user, email: 'tibbs@gmail.com', password: 'password')}
    it 'authenticates user' do
      post '/api/v1/auth', params: {email: user.email, password: 'password'}
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        "token" => "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDQ2OTM3NjN9.z6GBqfoRzOibwsfYiWFUtSfu9qrqgEHJRUYvZpI4Lv4"
      })
    end

    it 'returns an error when username is missing' do
      post '/api/v1/auth', params: {password: 'password'}

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        'error' => 'param is missing or the value is empty: email'
      })
    end

    it 'returns an error when password is missing' do
      post '/api/v1/auth', params: {email: user.email}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        'error' => 'param is missing or the value is empty: password'
      })
    end

    it 'returns an error when password is incorrect' do
      post '/api/v1/auth', params: {email: user.email, password: 'wrong'}
      expect(response).to have_http_status(:unauthorized)
    end

  end
end