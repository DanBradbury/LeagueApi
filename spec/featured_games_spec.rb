require 'spec_helper'

describe LeagueApi::FeaturedGames do
  before :all do
  end

  ["br", "eune", "euw", "kr", "lan", "las", "na", "oce", "ru", "tr"].each do |region|
  #["na"].each do |region|
    it "should get featured games for #{region}" do
      LeagueApi::FeaturedGames.fetch(region).should_not == nil
    end
  end

  it "should fetch the featured games for a region and match riot spec" do
      @featured = LeagueApi::FeaturedGames.featured("na")
      @featured.class.should == FeaturedGamesDto
      @featured.gameList.class.should == Array
      game_info = @featured.gameList.first
      game_info.class.should == FeaturedGameInfo
      # test FeaturedGameInfo here..
      game_info.bannedChampions.class.should == Array
      game_info.bannedChampions.first.class.should == BannedChampion
      game_info.participants.class.should == Array
      game_info.participants.first.class.should == Participant
      game_info.observers.class.should == Observer
  end
end
