require "spec_helper"
require 'pry'

RSpec.describe JwtCli::Runner, type: :lib do
  describe '#start' do
    let(:expected_hash_result) { 'eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoxLCJlbWFpbCI6ImZyb2RvQGdtYWlsLmNvbSIsImZvbyI6ImJhciJ9.' }

    it 'is a default task' do
      expect(described_class.default_task).to eq 'start'
    end

    it 'copies jwt unprotected token to clibboard' do
      allow_any_instance_of(JwtCli::InputBuilder).to receive(:ask).with("Enter EMAIL:").and_return('frodo@gmail.com')
      allow_any_instance_of(JwtCli::InputBuilder).to receive(:ask).with("Enter USER_ID:").and_return(1)
      allow(subject).to receive(:yes?).with('Any additional inputs? (yes/no)').and_return(true,false)
      allow_any_instance_of(JwtCli::InputBuilder).to receive(:ask).with("Enter key:").and_return('foo')
      allow_any_instance_of(JwtCli::InputBuilder).to receive(:ask).with("Enter value for foo:").and_return('bar')

      subject.start

      expect(Clipboard.paste).to eq expected_hash_result
    end
  end
end
