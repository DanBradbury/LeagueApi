require 'spec_helper'

describe LeagueApi do
	it "available requests should contain top level object" do
    available_requests = LeagueApi.available_requests.keys
		expect(available_requests.include?(LeagueApi)).to be_truthy
		expect(available_requests.include?(LeagueApi::Champion)).to be_truthy
	end

	it "should return a list of Champions" do
    champions = LeagueApi.get_champion_names
		expect(champions.include?("Thresh")).to be_truthy
		expect(champions.include?("BigBoy")).to be_falsey
	end

	it "should return a list of Items" do
    items = LeagueApi.get_item_names
		expect(items.include?("Enchantment: Cinderhulk")).to be_truthy
		expect(items.include?("Bulshit mcEnchant")).to be_falsey
	end

	it "should fetch a myself and get the summoner_id" do
		LeagueApi.get_summoner_id("iSixPool").should == 25087996
	end

	it "should get the last played game from summoner id" do
    last_game_keys = LeagueApi.get_last_game_played(25087996).keys
		expect(last_game_keys.include?("gameMode")).to be_truthy
		expect(last_game_keys.include?("gameType")).to be_truthy
	end

	it "should return the champion played in the last game" do
		LeagueApi.get_last_champion_played(25087996).class.should == String
	end

	it "should return the time when the last game was played" do
		LeagueApi.get_time_of_last_game(25087996).class.should == Time
	end
end
