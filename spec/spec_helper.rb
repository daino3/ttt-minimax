load File.expand_path('../../config/environment.rb',  __FILE__)

RSpec.configure do |config|
  config.failure_color = :yellow
  config.tty = true
  config.color = true
end
