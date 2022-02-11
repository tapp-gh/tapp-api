
require 'rails_helper'

describe JsonWebTokenService do
  # let(:user_id)
  let(:token) {described_class.encode(1)}

  it 'returns an authentication token' do
      
    decoded_token = JWT.decode(
      token, 
      described_class::SECRET_KEY,
      true, 
      {algorithm: described_class::ALGORITHM_TYPE}
    )
    expect(decoded_token).to eq([
      {"user_id" => 1, "exp" => 1644692001 },
      {"alg" => "HS256"}
    ])
  end

end