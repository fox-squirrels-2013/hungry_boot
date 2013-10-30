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
    "You added a new restaurant: #{r.name}, that serves #{r.cuisine} food, located at (or in) #{r.location} -- nice!"
  redirect '/restaurants/new'
end

get '/restaurants' do
  @restaurants = Restaurant.all
  erb :restaurant_index
end

get '/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show_restaurant
end

get '/edit/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :edit
end

put '/edit/:id' do
  r = Restaurant.find(params[:id])
  r.name = params[:name]
  r.location = params[:location]
  r.cuisine = params[:cuisine]
  r.save
  redirect '/restaurants'
end

get '/delete/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :confirm
end

delete '/:id' do
  r = Restaurant.find(params[:id])
  r.destroy
  redirect '/restaurants'
end
