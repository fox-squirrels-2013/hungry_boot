require 'sinatra/activerecord/rake'
require_relative 'app/app'
require 'dotenv/tasks'
require "rspec/core/rake_task"


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


desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
  t.pattern = 'spec/*_spec.rb'
end

task :default => :spec