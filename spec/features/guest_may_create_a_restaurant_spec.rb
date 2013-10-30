require 'spec_helper'

feature "Creating a restaurant without entering a cuisine" do
  scenario "Guest may create a restaurant" do
    visit '/restaurants/new'
    fill_in "name", with: "Pasilla"
    fill_in "location", with: "Down Pine"
    click_on "Record Restaurant!"
    save_and_open_page
    expect(page).to have_content("Restaurant: Pasilla, Located at Down Pine, Cuisine: #{r.cuisine}!")

  end
end

  feature "Creating a restaurant with entering a cuisine" do
  scenario "Guest may create a restaurant" do
    visit '/restaurants/new'
    fill_in "name", with: "Pasilla"
    fill_in "location", with: "Down Pine"
    fill_in "cuisine", with: "Mexican"
    click_on "Record Restaurant!"

    expect(page).to have_content("Restaurant: Pasilla, Located at Down Pine, Cuisine: Mexican!")
  end
end
