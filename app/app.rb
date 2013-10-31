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
                         price_range: params["restaurant"]["price_range"],
                         food_type: params["restaurant"]["food_type"]

  flash[:notice] =
    "You added a new restaurant: #{r.name}, food type : #{r.food_type}, located at #{r.location} -- nice!"
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

delete '/restaurants/delete' do
  Restaurant.destroy(params[:id])
  flash[:notice] = "Restaurant # #{params[:id]} deleted"
  redirect '/restaurants'
end
