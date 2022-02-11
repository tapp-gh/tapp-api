require 'rails_helper'

RSpec.describe 'AuthController', type: :request do
  describe 'POST /auth' do
    it 'authenticates user' do
      post '/api/v1/auth', params: {email: 'tibbs@gmail.com', password: 'password'}
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
        'token' => '123'
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
      post '/api/v1/auth', params: {email: 'tibbs@gmail.com'}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
        'error' => 'param is missing or the value is empty: password'
      })
    end

  end
end