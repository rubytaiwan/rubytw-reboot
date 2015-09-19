require "rails_helper"

RSpec.describe "Home page" do
  scenario "can access" do
    visit root_path

    expect(page).to have_content "Welcome to Ruby Taiwan"
  end
end
