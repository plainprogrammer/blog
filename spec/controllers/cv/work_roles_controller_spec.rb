require 'rails_helper'

RSpec.describe CV::WorkRolesController, type: :controller do
  let(:valid_attributes) { FactoryBot.attributes_for(:cv_work_role) }
  let(:work_role) { FactoryBot.create(:cv_work_role) }
  let(:user) { User.create!(email_address: "joe@example.org", password: "password") }

  before do
    controller.send(:start_new_session_for, user)
  end

  describe 'GET #edit' do
    it 'assigns the requested work role as @role' do
      get :edit, params: { id: work_role.id }
      expect(assigns(:role)).to eq(work_role)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the requested work role' do
        patch :update, params: { id: work_role.id, cv_work_role: valid_attributes }
        work_role.reload
        expect(work_role.title).to eq(valid_attributes[:title])
        expect(work_role.summary).to eq(valid_attributes[:summary])
      end

      it 'renders the cv/work_role partial' do
        patch :update, params: { id: work_role.id, cv_work_role: valid_attributes }
        expect(response).to render_template(partial: 'cv/_work_role')
      end
    end
  end
end
