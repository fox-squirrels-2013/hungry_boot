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
  p params
  # if save succeeds
  #   set flash to success message
  # else
  #   set flash to error
  # end
  # redirect
  r = Restaurant.create! name: params["restaurant"]["name"],
                         location: params["restaurant"]["location"],
                         cuisine: params["restaurant"]["cuisine"]
p r
  flash[:notice] =
    "Restaurant: #{r.name}, Located at #{r.location}, Cuisine: #{r.cuisine}!"
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