require 'rails_helper'

RSpec.describe CV::EducationsController, type: :controller do
  let(:valid_attributes) { FactoryBot.attributes_for(:cv_education) }
  let(:invalid_attributes) { { institution: '', degree: '', to_month: '', to_year: '' } }
  let(:education) { FactoryBot.create(:cv_education) }
  let(:user) { User.create!(email_address: "joe@example.org", password: "password") }

  before do
    controller.send(:start_new_session_for, user)
  end

  describe 'GET #new' do
    it 'assigns a new education as @education' do
      get :new
      expect(assigns(:education)).to be_a_new(CV::Education)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new CV::Education' do
        expect {
          post :create, params: { cv_education: valid_attributes }
        }.to change(CV::Education, :count).by(1)
      end

      it 'renders the cv/educations partial' do
        post :create, params: { cv_education: valid_attributes }
        expect(response).to render_template(partial: 'cv/_educations')
      end
    end

    context 'with invalid params' do
      it 'does not create a new CV::Education' do
        expect {
          post :create, params: { cv_education: invalid_attributes }
        }.not_to change(CV::Education, :count)
      end

      it 'renders the cv/educations partial' do
        post :create, params: { cv_education: invalid_attributes }
        expect(response).to render_template(partial: 'cv/_educations')
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested education as @education' do
      get :edit, params: { id: education.id }
      expect(assigns(:education)).to eq(education)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the requested education' do
        patch :update, params: { id: education.id, cv_education: valid_attributes }
        education.reload
        expect(education.institution).to eq('A School')
        expect(education.degree).to eq('A Degree')
      end

      it 'renders the cv/education partial' do
        patch :update, params: { id: education.id, cv_education: valid_attributes }
        expect(response).to render_template(partial: 'cv/_education')
      end
    end

    context 'with invalid params' do
      it 'does not update the education' do
        patch :update, params: { id: education.id, cv_education: invalid_attributes }
        education.reload
        expect(education.institution).not_to eq('')
        expect(education.degree).not_to eq('')
      end

      it 'renders the cv/education partial' do
        patch :update, params: { id: education.id, cv_education: invalid_attributes }
        expect(response).to render_template(partial: 'cv/_education')
      end
    end
  end
end
