require 'simplecov'
SimpleCov.start do
  add_group "Garbage", "spec/"
end
require 'rspec'
require 'league_api'
module LeagueApi
  @test_counter = 0
  def make_request(base, modifier=nil, params=nil, region=nil)
    @test_counter+=1
    if(@test_counter%4==0)
      sleep(3)
    end

    region = @default_region if region.nil?
    base = change_base(base, region)

    url = base + modifier
    url << add_query_string(params)

    uri = URI.parse(url)
    JSON.parse(uri.read)
  end
end

RSpec.configure do |config|
  config.order = 'random'
end
