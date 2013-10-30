require 'spec_helper'

describe "web requests" do
  it "creates a new restaurant" do
    params = { 'restaurant' => {'name' => "Sushiritto",
                                'location' => "Down on Kearny",
                                'cuisine' => "Asian Fusion"} }
    expect {post '/restaurants', params}.to change {Restaurant.all.length}.by(1)
  end

  it "deletes a restaurant" do
    params = {'restaurant' => {'id' => 1} }
    expect {post '/restaurants/delete', params}.to change {Restaurant.all.length}.by(1)
  end
end
