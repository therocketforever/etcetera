require 'bundler'

Bundler.require
require File.expand_path(File.dirname(__FILE__) + '/handlebars')

require "./application"
run Application

