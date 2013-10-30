require 'spec_helper'

feature "Creating a restaurant" do
  scenario "Guest may create a restaurant" do
    visit '/restaurants/new'
    fill_in "name", with: "Pasilla"
    fill_in "location", with: "Down Pine"
    click_on "Record Restaurant!"

    expect(page).to have_content("You added a new restaurant: Pasilla")
  end
  
  scenario "Guest may create a restaurant with a rating" do
    visit '/restaurants/new'
    fill_in "name", with: "Pasilla"
    fill_in "location", with: "Down Pine"
    fill_in "rating", with: 2
    click_on "Record Restaurant!"

    expect(page).to have_content("with a 2 star rating")
  end

  scenario "Guest may delete a restaurant" do
    visit '/restaurants/delete'
    fill_in "name", with: "Pasilla"
    click_on "Delete Restaurant!"

    expect(page).to have_content("You deleted a restaurant: Pasilla")
  end

end
