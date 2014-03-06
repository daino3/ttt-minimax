Dir['models/*.rb'].each { |file| load file }
Dir['models/interface/*.rb'].each { |file| load file }
Dir['models/cpu_strategy/*.rb'].each { |file| load file }
load 'config/constants.rb'

require 'rspec'
require 'pry'
