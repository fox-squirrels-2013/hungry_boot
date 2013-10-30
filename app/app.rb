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
                         cuisine: params["restaurant"]["cuisine"]
  flash[:notice] =
    "You added a new restaurant: #{r.name}, located at #{r.location} -- nice!"
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

post '/restaurants/delete/:id' do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.delete
  erb :restaurant_index

  flash[:notice] =
    "You deleted the restaurant"
  redirect '/restaurants'
end

helpers do
  def delete_restaurant_at_id(restaurant_id)
    erb :delete_restaurant, locals: { restaurant_id: restaurant_id }
  end
end