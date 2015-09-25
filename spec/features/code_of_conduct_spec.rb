require "rails_helper"

RSpec.describe "Code of Conduct page" do
  scenario "markdown renders correctly" do
    visit code_of_conduct_path

    expect(page).to have_css "h1", text: "Contributor Code of Conduct"
  end
end
