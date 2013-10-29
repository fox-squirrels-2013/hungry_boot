require 'sinatra'
require 'active_record'
require './app/models/restaurant'

require 'dotenv'
Dotenv.load

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: ENV['database'])

get '/' do
  "Hello World!"
end
