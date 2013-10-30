require 'spec_helper'

feature "Deleting a restaurant" do
  scenario "Guest may delete a restaurant" do
    Restaurant.create(name: "the place", location: "The Moon", cuisine: "moon food")
    visit '/restaurants'
    click_on "Delete"
    expect(page).to have_content("You deleted the restaurant")
  end
end
