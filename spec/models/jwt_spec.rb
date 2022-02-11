
require 'rails_helper'

describe JsonWebToken do
  let!(:token) {described_class.encode(1)}

  it 'returns an authentication token' do
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