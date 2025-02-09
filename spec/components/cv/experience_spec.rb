require "rails_helper"

RSpec.describe CV::Experience, type: :component do
  before do
    company = CV::WorkTenure.create!(
      employer: "Tech Corp",
      from_month: 1,
      from_year: 2020,
      to_month: 12,
      to_year: 2022
    )

    CV::WorkRole.create!(
      work_tenure: company,
      title: "Senior Developer",
      summary: "Led development of core features"
    )
  end

  it "renders the work experience section with tenure and role information" do
    render_inline(CV::Experience.new)

    expect(page).to have_content("Work Experience")
    expect(page).to have_content("Tech Corp")
    expect(page).to have_content(/1\/2020 to\s+12\/2022/)
    expect(page).to have_content("Senior Developer")
    expect(page).to have_content("Led development of core features")
  end
end
