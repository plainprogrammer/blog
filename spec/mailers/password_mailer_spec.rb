require 'rails_helper'

RSpec.describe PasswordsMailer, type: :mailer do
  describe 'reset' do
    let(:user) { User.create!(email_address: 'user@example.com', password: 'secret123') }
    let(:mail) { PasswordsMailer.reset(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Reset your password')
      expect(mail.to).to eq([ user.email_address ])
      expect(mail.from).to eq([ 'from@example.com' ])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("You can reset your password within the next 15 minutes on this password reset page:")
    end
  end
end
