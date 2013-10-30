require 'spec_helper'

describe "web requests" do
  it "creates a new restaurant" do
    params = { 'restaurant' => {'name' => "Sushiritto",
                                'location' => "Down on Kearny"} }
    expect {post '/restaurants', params}.to change {Restaurant.all.length}.by(1)
  end

  it "does not create restaurant without a location" do
    params = { 'restaurant' => {'name' => "Sushiritto" } }
    expect {post '/restaurants', params}.to change {Restaurant.all.length}.by(0)
  end

  it "creates a restaurant with a price range" do
    params = { 'restaurant' => {'name' => "Pasilla",
                                'location' => "on Pine",
                                'price_range' => 1 } }
    post '/restaurants', params
    Restaurant.last.price_range.should == 1
  end
end
