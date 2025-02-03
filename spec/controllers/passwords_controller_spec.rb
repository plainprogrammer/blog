require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
  let(:user) { User.create!(email_address: 'user@example.com', password: 'secret123') }
  let(:valid_token) { user.password_reset_token }
  let(:invalid_token) { 'invalidtoken' }

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'when user exists' do
      it 'sends password reset instructions and redirects to new session path' do
        post :create, params: { email_address: user.email_address }
        expect(response).to redirect_to(new_session_path)
        expect(flash[:notice]).to eq('Password reset instructions sent (if user with that email address exists).')
      end
    end

    context 'when user does not exist' do
      it 'redirects to new session path with notice' do
        post :create, params: { email_address: 'nonexistent@example.com' }
        expect(response).to redirect_to(new_session_path)
        expect(flash[:notice]).to eq('Password reset instructions sent (if user with that email address exists).')
      end
    end
  end

  describe 'GET #edit' do
    context 'with valid token' do
      it 'returns a successful response' do
        get :edit, params: { token: valid_token }
        expect(response).to be_successful
      end
    end

    context 'with invalid token' do
      it 'redirects to new password path with alert' do
        get :edit, params: { token: invalid_token }
        expect(response).to redirect_to(new_password_path)
        expect(flash[:alert]).to eq('Password reset link is invalid or has expired.')
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid token and matching passwords' do
      it 'resets the password and redirects to new session path' do
        patch :update, params: { token: valid_token, password: 'newpassword', password_confirmation: 'newpassword' }
        expect(response).to redirect_to(new_session_path)
        expect(flash[:notice]).to eq('Password has been reset.')
      end
    end

    context 'with valid token and non-matching passwords' do
      it 'redirects to edit password path with alert' do
        patch :update, params: { token: valid_token, password: 'newpassword', password_confirmation: 'wrongpassword' }
        expect(response).to redirect_to(edit_password_path(valid_token))
        expect(flash[:alert]).to eq('Passwords did not match.')
      end
    end

    context 'with invalid token' do
      it 'redirects to new password path with alert' do
        patch :update, params: { token: invalid_token, password: 'newpassword', password_confirmation: 'newpassword' }
        expect(response).to redirect_to(new_password_path)
        expect(flash[:alert]).to eq('Password reset link is invalid or has expired.')
      end
    end
  end
end
