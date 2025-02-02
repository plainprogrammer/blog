require 'rails_helper'

RSpec.describe CV::Education, type: :model do
  subject(:education) { FactoryBot.create(:cv_education) }

  its(:to_month) { is_expected.to eq 5 }
  its(:to_year) { is_expected.to eq 2006 }
  its(:institution) { is_expected.to eq "A School" }
  its(:degree) { is_expected.to eq "A Degree" }

  it { is_expected.to validate_inclusion_of(:to_month).in_range(1..12) }
end
