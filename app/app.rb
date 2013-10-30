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
  Restaurant.create! name:     params["restaurant"]["name"],
                    location: params["restaurant"]["location"]
  flash[:notice] = "The last restaurant recorded is #{params["restaurant"]["name"]}!"
  redirect '/restaurants/new'
end
