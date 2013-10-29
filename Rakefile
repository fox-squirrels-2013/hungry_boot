require 'sinatra/activerecord/rake'
require './app'
require 'dotenv/tasks'

namespace :db do
  desc "create the postgres database"
  task :create => :dotenv do
    `createdb #{ENV['database']}`
  end

  desc "drop the postgres database"
  task :drop => :dotenv do
    `dropdb #{ENV['database']}`
  end
end
