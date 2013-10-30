require 'spec_helper'

feature "Creating a restaurant" do
  scenario "Guest may create a restaurant" do
    visit '/restaurants/new'
    fill_in "name", with: "Pasilla"
    fill_in "location", with: "Down Pine"
    click_on "Record Restaurant!"

    expect(page).to have_content("You added a new restaurant: Pasilla")
  end
end
