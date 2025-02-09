require "rails_helper"

RSpec.describe ApplicationMailer, type: :mailer do
  subject(:mailer) { described_class.new }

  it "has the correct default from address" do
    expect(ApplicationMailer.default[:from]).to eq("james@thomps.onl")
  end
end
