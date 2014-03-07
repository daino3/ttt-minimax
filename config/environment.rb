Dir['lib/*.rb'].each { |file| load file }
Dir['lib/interface/*.rb'].each { |file| load file }
Dir['lib/cpu_strategy/*.rb'].each { |file| load file }
load 'config/constants.rb'

require 'rspec'
require 'pry'
