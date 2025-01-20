require 'rails_helper'

RSpec.describe CV::Education, type: :model do
  subject(:education) { described_class.new(to_month: 5, to_year: 2006, institution: "A School", degree: "A Degree") }

  its(:to_month) { is_expected.to eq 5 }
  its(:to_year) { is_expected.to eq 2006 }
  its(:institution) { is_expected.to eq "A School" }
  its(:degree) { is_expected.to eq "A Degree" }

  it { is_expected.to validate_inclusion_of(:to_month).in_range(1..12) }
end
