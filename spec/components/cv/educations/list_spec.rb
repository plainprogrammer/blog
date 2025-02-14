require "rails_helper"

RSpec.describe CV::Educations::List, type: :component do
  let!(:education) { CV::Education.create!(institution: "A College", degree: "B.S.", to_month: 6, to_year: 2021) }

  its(:educations) { is_expected.to eq [ education ] }

  it "renders a list of educations" do
    render_inline(CV::Educations::List.new)

    expect(page).to have_content("A College")
    expect(page).to have_content("B.S.")
    expect(page).to have_content("6/2021")
  end
end
