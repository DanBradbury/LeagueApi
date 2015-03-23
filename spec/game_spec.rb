require 'spec_helper'

describe LeagueApi::Game do

	it "should find recent games given a valid id" do
		LeagueApi::Game.recent_games(40314769)
    # TODO: come up with a different (more consistent) way to test all regions
    #LeagueApi::Game.recent_games(31821331, "euw").should_not == nil
    #LeagueApi::Game.recent_games(21749000, "eune").should_not == nil
	end
end
