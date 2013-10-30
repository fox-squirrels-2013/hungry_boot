require 'sinatra'
require 'active_record'
require './app/models/restaurant'

require 'dotenv'
Dotenv.load

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: ENV['database'])

get '/restaurants/new' do
  @last = Restaurant.last
  erb :new_restaurant
end

post '/restaurants' do
  Restaurant.create name:     params["restaurant"]["name"],
                    location: params["restaurant"]["location"]
  redirect '/restaurants/new'
end
