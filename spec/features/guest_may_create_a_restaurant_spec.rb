require 'spec_helper'

feature "Creating a restaurant" do
  scenario "User can create a restaurant" do
    visit '/restaurants/new'
    fill_in "name", with: "Pasilla"
    fill_in "location", with: "Down Pine"
    click_on "Record Restaurant!"

    expect(page).to have_content("You added a new restaurant: Pasilla")
  end

  scenario "User gets an error message if restaurant location is not entered" do
    visit '/restaurants/new'
    fill_in "name", with: "Pasilla2"
    click_on "Record Restaurant!"

    expect(page).to have_content("something went wrong")
  end

end
