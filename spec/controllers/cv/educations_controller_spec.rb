require 'rails_helper'

RSpec.describe CV::EducationsController, type: :controller do
  let!(:education) { CV::Education.create!(institution: "A School", degree: "A Degree", to_month: 1, to_year: 2022) }

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: education.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: education.id }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) { { degree: 'New Degree' } }

      it 'updates the requested education' do
        patch :update, params: { id: education.id, cv_education: new_attributes }
        education.reload
        expect(education.degree).to eq('New Degree')
      end

      it 'redirects to the education' do
        patch :update, params: { id: education.id, cv_education: new_attributes }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e., to display the edit template)' do
        patch :update, params: { id: education.id, cv_education: { degree: nil } }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested education' do
      expect {
        delete :destroy, params: { id: education.id }
      }.to change(CV::Education, :count).by(-1)
    end

    it 'redirects to the educations list' do
      delete :destroy, params: { id: education.id }
      expect(response).to redirect_to(root_url)
    end
  end
end
