require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_secure_password }
  it { is_expected.to have_many(:sessions).dependent(:destroy) }

  it "normalizes email address" do
    user = User.build(email_address: ' USER@Example.Com ')
    expect(user.email_address).to eq('user@example.com')
  end
end
