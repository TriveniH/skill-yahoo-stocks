# Gems
require 'sinatra'
require 'json'
require "awesome_print"
require "newrelic_rpm"


# Models
# require "./models/project"


# App
require './app/api'

$stdout.sync = true

set :raise_errors, true
set :show_exceptions, false

