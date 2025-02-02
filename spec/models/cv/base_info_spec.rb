require 'rails_helper'

RSpec.describe CV::BaseInfo, type: :model do
  subject(:base_info) { FactoryBot.build(:cv_base_info) }

  its(:name) { is_expected.to eq "John Doe" }
  its(:subtitle) { is_expected.to eq "Sr Software Engineer" }
  its(:summary) { is_expected.to eq "A short summary" }
end
