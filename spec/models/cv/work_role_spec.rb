require 'rails_helper'

RSpec.describe CV::WorkRole, type: :model do
  subject(:role) { described_class.new(title: "Boss", summary: "I did awesome!", position: 1, work_tenure: tenure) }
  let(:tenure) { CV::WorkTenure.create(from_month: 1, from_year: 2006, employer: "Company", to_present: true) }

  its(:title) { is_expected.to eq "Boss" }
  its(:summary) { is_expected.to eq "I did awesome!" }
  its(:position) { is_expected.to eq 1 }
  its(:work_tenure) { is_expected.to eq tenure }

  it { is_expected.to belong_to(:work_tenure).class_name("CV::WorkTenure").with_foreign_key("cv_work_tenures_id") }

  it { is_expected.to validate_uniqueness_of(:position).scoped_to(:cv_work_tenures_id) }
end
