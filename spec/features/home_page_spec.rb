require "rails_helper"

RSpec.describe "Home page", type: :feature do
  scenario "visit" do
    visit "/"
    expect(page).to have_content "Welcome to Ruby Taiwan"
  end
end
