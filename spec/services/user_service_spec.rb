
require 'rails_helper'

RSpec.describe UserService do
  describe '.generate_token_and_details' do
    let (:user){create(:user, is_active: true)}
    it "generates token a of the user" do
      user_new = described_class.new(user)
      token = user_new.generate_token
      expect(user_new.generate_token_and_details).to eq({
          "user": {
            "date_of_birth": user.date_of_birth,
            "email": user.email,
            "name": user.name
          },
          "token": token
      })

    end
  end
end