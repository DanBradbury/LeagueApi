require 'spec_helper'

describe LeagueApi::FeaturedGames do
  before :all do
  end

  ["br", "eune", "euw", "kr", "lan", "las", "na", "oce", "pbe", "ru", "tr"].each do |region|
    it "should get featured games for #{region}" do
      LeagueApi::FeaturedGames.fetch(region).should_not == nil
    end
  end
end
