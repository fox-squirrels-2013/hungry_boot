require 'spec_helper'

feature "Creating a restaurant" do
  scenario "Guest may create a restaurant" do
    visit '/restaurants/new'
    fill_in "name", with: "Pasilla"
    fill_in "location", with: "Down Pine"
    click_on "Record Restaurant!"

    expect(page).to have_content("The last restaurant recorded is Pasilla!")
  end
end

# feature "Claiming a lightning talk" do
#   let(:user_attributes) { random_user_attributes }
#   let!(:user) { User.create(user_attributes) }
#   let!(:talk) { create_random_unclaimed_talk }
#   let!(:claimed_talk) { create_random_claimed_talk }

#   scenario "Registered user may claim a lightning talk" do
#     login(user_attributes)
#     visit '/'
#     within "#talk-#{talk.id}" do
#       click_on "I'll do it!"
#     end

#     expect(page).to have_content("#{talk.name} - Presented By #{user.name}")
#   end

#   scenario "Claimed talks are not listed under suggested talks" do
#     login(user_attributes)
#     visit '/'

#     within '#suggested-talks' do
#       expect(page).not_to have_selector("#talk-#{claimed_talk.id}")
#     end
#   end
# end