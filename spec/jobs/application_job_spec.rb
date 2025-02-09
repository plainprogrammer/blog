require "rails_helper"

RSpec.describe ApplicationJob, type: :job do
  subject(:job) { described_class.new }

  it "is a ActiveJob::Base" do
    expect(job).to be_a(ActiveJob::Base)
  end
end
