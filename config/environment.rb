Dir['models/*.rb'].each { |file| load file }
load 'config/constants.rb'

require 'rspec'
require 'pry'