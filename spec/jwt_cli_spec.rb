require "spec_helper"

RSpec.describe JwtCli, type: :lib do
  it "has a version number" do
    expect(JwtCli::VERSION).not_to be nil
  end
end
