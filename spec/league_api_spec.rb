require 'spec_helper'

describe LeagueApi do
	it "should gather all available requests for the gem" do
		LeagueApi.available_requests.keys.should == [LeagueApi, LeagueApi::Champion, LeagueApi::Static, LeagueApi::Game, LeagueApi::Summoner, LeagueApi::League, LeagueApi::Team, LeagueApi::Stats, LeagueApi::Util, LeagueApi::FeaturedGames, LeagueApi::CurrentGame]
	end

	it "should return a list of Champions" do
		LeagueApi.get_champion_names.first.should == "Thresh"
	end

	it "should return a list of Items" do
		LeagueApi.get_item_names.first.should == "Enchantment: Cinderhulk"
	end

	it "should fetch a summoners id from the summoner name" do
		LeagueApi.get_summoner_id("iSixPool").should == 25087996
    #TODO: remove this line when full region testing has been added
		#LeagueApi.get_summoner_id("Pablô", "euw").should == 31821331
	end

	it "should get the last played game from summoner id" do
		LeagueApi.get_last_game_played(25087996).keys.should == ["gameId", "invalid", "gameMode", "gameType", "subType", "mapId", "teamId", "championId", "spell1", "spell2", "level", "ipEarned", "createDate", "fellowPlayers", "stats"]
	end

	it "should return the champion played in the last game" do
		LeagueApi.get_last_champion_played(25087996).class.should == String
	end

	it "should return the time when the last game was played" do
		LeagueApi.get_time_of_last_game(25087996).class.should == Time
	end

end
