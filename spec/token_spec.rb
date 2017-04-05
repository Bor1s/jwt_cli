require "spec_helper"

RSpec.describe JwtCli::Token, type: :lib do
  describe ".generate" do
    let(:payload) { { email: 'frodo@gmail.com', user_id: 1, 'foo' => 'bar' } }
    let(:expected_hash_result) { 'eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJlbWFpbCI6ImZyb2RvQGdtYWlsLmNvbSIsInVzZXJfaWQiOjEsImZvbyI6ImJhciJ9.' }

    it 'creates unprotected token' do
      expect(described_class.generate(payload)).to eq expected_hash_result
    end
  end
end
