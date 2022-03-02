
require 'rails_helper'

describe JsonWebToken do
  let!(:token) {described_class.encode(1)}
  let!(:decoded){described_class.decode(token)}
  describe ".decode" do

    it 'returns user data' do
      decoded_token = JWT.decode(
        token, 
        described_class::SECRET_KEY,
        true, 
        {algorithm: described_class::ALGORITHM_TYPE}
      )
      expect(decoded_token).to eq([
        {"user_id" => 1, "exp"=> decoded_token[0]["exp"] },
        {"alg" => "HS256"}
      ])
    end
  end

  describe ".encode" do
    it "returns an authentication token " do
      payload = {"user_id": 1, "exp": 24.hours.from_now.to_i}
      encode = JWT.encode(payload, described_class::SECRET_KEY, described_class::ALGORITHM_TYPE)
      expect(encode).to eq(token)
    end
  end

end