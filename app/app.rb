require 'sinatra'
require 'active_record'
require './app/models/restaurant'

require 'dotenv'
Dotenv.load

require 'rack-flash'
enable :sessions
set :session_secret, 'SOME LONG STRING TO USE FOR SESSION COOKIE ENCRYPTION'
use Rack::Flash

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: ENV['database'])

get '/restaurants/new' do
  erb :new_restaurant
end

post '/restaurants' do
  r = Restaurant.create! name: params["restaurant"]["name"],
                         location: params["restaurant"]["location"],
                         rating: params["restaurant"]["rating"]
  flash[:notice] =
  if r.rating
    "You added a new restaurant: #{r.name}, located at #{r.location}, with a #{r.rating} star rating -- nice!"
  else
    "You added a new restaurant: #{r.name}, located at #{r.location} -- nice!"
  end
  redirect '/restaurants/new'
end

get '/restaurants' do
  @restaurants = Restaurant.all
  erb :restaurant_index
end


get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show_restaurant
end

get '/restaurants/delete/:id' do
  r = Restaurant.find(params[:id])
  r.destroy
end