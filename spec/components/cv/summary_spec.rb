require "rails_helper"

RSpec.describe CV::Summary, type: :component do
  it "renders the summary section with personal information" do
    render_inline(CV::Summary.new)

    expect(page).to have_content("James Thompson")
    expect(page).to have_content("Hands-On Software Architect")
    expect(page).to have_content("over 20 years experience")
    expect(page).to have_content("Ruby on Rails")
    expect(page).to have_css("img[src='/headshot.jpg']")
    expect(page).to have_css("img[alt='Headshot of James Thompson']")
  end
end
