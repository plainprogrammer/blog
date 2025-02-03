require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { User.create!(email_address: 'user@example.com', password: 'password123') }

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'authenticates the user and redirects to root' do
        post :create, params: { email_address: user.email_address, password: 'password123' }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'with invalid credentials' do
      it 'redirects to new_session_path with an alert' do
        post :create, params: { email_address: user.email_address, password: 'wrongpassword' }
        expect(response).to redirect_to(new_session_path)
        expect(flash[:alert]).to eq('Try another email address or password.')
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      post :create, params: { email_address: user.email_address, password: 'password123' }
    end

    it 'terminates the session and redirects to new_session_path' do
      delete :destroy
      expect(response).to redirect_to(new_session_path)
    end
  end
end
