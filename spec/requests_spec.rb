require 'spec_helper'

describe "web requests" do
  it "creates a new restaurant" do
    params = { 'restaurant' => {'name' => "Sushiritto",
                                'location' => "Down on Kearny",
                                'cuisine' => "Japanese-Mexican"} }
    expect {post '/restaurants', params}.to change {Restaurant.all.length}.by(1)
  end

  it "fails to create a new restaurant without a cuisine" do
    params = { 'restaurant' => {'name' => "Sushiritto",
                                'location' => "Down on Kearny"} }
    expect {post '/restaurants', params}.to change {Restaurant.all.length}.by(0)
  end

end
