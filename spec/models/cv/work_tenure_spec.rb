require 'rails_helper'

RSpec.describe CV::WorkTenure do
  subject(:work_tenure) { described_class.new(from_month: 1, from_year: 2025, to_present: true, employer: "Demo Inc.") }

  its(:from_month) { is_expected.to eq 1 }
  its(:from_year) { is_expected.to eq 2025 }
  its(:to_month) { is_expected.to be_nil }
  its(:to_year) { is_expected.to be_nil }
  its(:to_present?) { is_expected.to be_truthy }
  its(:employer) { is_expected.to eq "Demo Inc." }

  it { is_expected.to validate_inclusion_of(:from_month).in_range(1..12) }
  it { is_expected.to validate_inclusion_of(:to_month).in_range(1..12).allow_nil }
end
