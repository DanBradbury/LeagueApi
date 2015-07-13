require 'spec_helper'

describe LeagueApi::Game do

  context "Riot API Spec" do
    it "should define a recent games for a summonerId" do
		  recent_response = LeagueApi::Game.recent(40314769)
      recent_response.class.should == RecentGamesDto
      recent_response.games.first.class.should == GameDto
      recent_response.games.first.fellowPlayers.first.class.should == PlayerDto
      recent_response.games.first.stats.class.should == RawStatsDto
    end
  end
	#it "should find recent games given a valid id" do
		#LeagueApi::Game.recent_games(40314769)
    # TODO: come up with a different (more consistent) way to test all regions
    #LeagueApi::Game.recent_games(31821331, "euw").should_not == nil
    #LeagueApi::Game.recent_games(21749000, "eune").should_not == nil
	#end
end
