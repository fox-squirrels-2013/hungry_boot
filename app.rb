require 'sinatra'
require 'active_record'
require './app/models/restaurant'

require 'dotenv'
Dotenv.load

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: ENV['database'])

post '/restaurants' do
  Restaurant.create name: params["name"], location: params["location"]
end
