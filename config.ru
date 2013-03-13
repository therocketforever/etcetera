require 'bundler'

Bundler.require
require File.expand_path('../public/app', __FILE__)

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets'
  #environment.append_path 'test' if (App.development? || App.test?)
  run environment
end

require "./application"
run Application

