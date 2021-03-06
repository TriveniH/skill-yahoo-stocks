# Gems
require 'sinatra'
require 'json'
require 'awesome_print'
require 'newrelic_rpm'
require 'oauth'
require 'httparty'
require 'redis'


# App
require './app/api'
require './app/cacheable'
require './app/yelp'
require './app/Utils'
require './app/descriptionParams'
require './app/stocks'
require './app/api_request'

$stdout.sync = true

set :raise_errors, true
set :show_exceptions, false

