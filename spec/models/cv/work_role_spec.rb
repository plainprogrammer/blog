require 'rails_helper'

RSpec.describe CV::WorkRole, type: :model do
  subject(:role) { FactoryBot.build :cv_work_role }

  its(:title) { is_expected.to eq "Boss" }
  its(:summary) { is_expected.to eq "I did awesome!" }
  its(:position) { is_expected.to eq 1 }

  it { is_expected.to belong_to(:work_tenure).class_name("CV::WorkTenure").with_foreign_key("cv_work_tenures_id") }

  it { is_expected.to validate_uniqueness_of(:position).scoped_to(:cv_work_tenures_id) }
end
