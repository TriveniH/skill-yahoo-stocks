# Gems
require 'sinatra'
require 'json'
require 'awesome_print'
require 'newrelic_rpm'
require 'oauth'
require 'redis'


# App
require './app/api'
require './app/cacheable'
require './app/yelp'

$stdout.sync = true

set :raise_errors, true
set :show_exceptions, false

