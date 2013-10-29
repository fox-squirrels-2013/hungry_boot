require 'sinatra'
require 'active_record'
require './app/models/restaurant'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'sinatra_skeleton_dev')

get '/' do
  "Hello World!"
end
