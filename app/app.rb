require 'sinatra'
require 'active_record'
require './app/models/restaurant'

require 'dotenv'
Dotenv.load

require 'rack-flash'
enable :sessions
use Rack::Flash

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: ENV['database'])

get '/restaurants/new' do
  erb :new_restaurant
end

post '/restaurants' do
  r = Restaurant.create! name: params["restaurant"]["name"],
                         location: params["restaurant"]["location"]
  flash[:notice] =
    "You added a new restaurant: #{r.name}, located at #{r.location} -- nice!"
  redirect '/restaurants/new'
end

get '/restaurants' do
  @restaurants = Restaurant.all
  erb :restaurant_index
end
