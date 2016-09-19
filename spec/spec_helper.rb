require 'rack'
require 'rspec'
require 'rack/test'
require 'webmock/rspec'


ENV[ 'RACK_ENV'   ] = 'test'

 # App
require './app/init'


# Helpers
require './spec/shared/helpers'


RSpec.configure do |config|
  config.filter_run focus:true
  config.run_all_when_everything_filtered = true
  config.color = true

  config.include Rack::Test::Methods

  config.backtrace_exclusion_patterns = [
    /\/lib\d*\/ruby\//,
    /bin\//,
    /gems/,
    /spec\/spec_helper\.rb/,
    /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]
end

def app
  Sinatra::Application
end
