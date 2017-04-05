require "spec_helper"
require 'pry'

RSpec.describe JwtCli::Input, type: :lib do
  describe '#init' do
    it 'is a default task' do
      expect(described_class.default_task).to eq 'init'
    end
  end
end
