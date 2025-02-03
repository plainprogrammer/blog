require 'rails_helper'

RSpec.describe CV::WorkTenure do
  subject(:work_tenure) { FactoryBot.create(:cv_work_tenure) }

  its(:from_month) { is_expected.to eq 1 }
  its(:from_year) { is_expected.to eq 2024 }
  its(:to_month) { is_expected.to eq 12 }
  its(:to_year) { is_expected.to eq 2024 }
  its(:to_present?) { is_expected.to be_falsey }
  its(:employer) { is_expected.to eq "Demo Inc." }

  it { is_expected.to validate_inclusion_of(:from_month).in_range(1..12) }
  it { is_expected.to validate_inclusion_of(:to_month).in_range(1..12).allow_nil }

  describe "#start_date=" do
    it "sets the from_month and from_year" do
      work_tenure.start_date = Date.new(2025, 1, 1)
      expect(work_tenure.from_month).to eq 1
      expect(work_tenure.from_year).to eq 2025
    end
  end

  describe "#end_date=" do
    it "sets the to_month and to_year" do
      work_tenure.end_date = Date.new(2025, 12, 31)
      expect(work_tenure.to_month).to eq 12
      expect(work_tenure.to_year).to eq 2025
    end
  end
end
