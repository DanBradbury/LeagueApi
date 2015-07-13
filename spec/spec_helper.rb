require 'rspec'
require 'league_api'
require 'pry'

RSpec.configure do |config|
  config.order = 'random'
  #XXX: need better sleep pattern
  config.after(:all) {sleep 10} #allows us to run entire test suite without breaking request limit
end
