require 'spec_helper'

describe "web requests" do
  it "creates a new restaurant" do
    params = {'name'=>"Sushiritto", 'location'=>"Down on Kearny"}
    expect {post '/restaurants', params}.to change {Restaurant.all.length}.by(1)
  end
end