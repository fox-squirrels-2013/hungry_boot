require './app'
require 'shoulda-matchers'
require 'rack/test'

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before do
    Restaurant.destroy_all
  end
end
