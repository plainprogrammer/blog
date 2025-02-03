require 'rails_helper'

RSpec.describe CV::WorkTenuresController, type: :controller do
  let(:valid_attributes) { FactoryBot.attributes_for(:cv_work_tenure) }
  let(:invalid_attributes) { { employer: '', from_month: '', from_year: '', to_month: '', to_year: '', to_present: false } }
  let(:work_tenure) { FactoryBot.create(:cv_work_tenure) }
  let(:user) { User.create!(email_address: "joe@example.org", password: "password") }

  before do
    controller.send(:start_new_session_for, user)
  end

  describe 'GET #edit' do
    it 'assigns the requested work tenure as @tenure' do
      get :edit, params: { id: work_tenure.id }
      expect(assigns(:tenure)).to eq(work_tenure)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the requested work tenure' do
        patch :update, params: { id: work_tenure.id, cv_work_tenure: valid_attributes }
        work_tenure.reload
        expect(work_tenure.employer).to eq("Demo Inc.")
        expect(work_tenure.from_month).to eq(1)
        expect(work_tenure.from_year).to eq(2024)
        expect(work_tenure.to_month).to eq(12)
        expect(work_tenure.to_year).to eq(2024)
        expect(work_tenure.to_present).to be_falsey
      end

      it 'renders the cv/work_tenure partial' do
        patch :update, params: { id: work_tenure.id, cv_work_tenure: valid_attributes }
        expect(response).to render_template(partial: 'cv/_work_tenure')
      end
    end
  end
end
