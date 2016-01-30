require 'spec_helper'

describe LeagueApi::Util do
  before(:all) do
    @util = LeagueApi::Util
    @last_game ||= LeagueApi.get_last_game_played("25087996")
  end


  it "should sort players onto teams" do
    sorted_list = @util.organize_players(@last_game["fellowPlayers"])
    sorted_list.is_a?(Array).should == true
    sorted_list.first["teamId"].should == 100
    sorted_list.last["teamId"].should == 200
  end

  it "should get important game stats from the game stats" do
    sorted_stats = @util.get_game_stats(@last_game["stats"])
    sorted_stats.keys.include?("Gold Earned").should == true
  end

  it "should return a RAW list of 6 items + trinket" do
    item_list = @util.get_raw_item_list(@last_game["stats"])

    item_list.each do |item|
      item.is_a?(Integer).should == true if item
    end
  end

  it "should return a translated list of the item bag" do
    raw_item_list = @util.get_raw_item_list(@last_game["stats"])
    item_list = @util.get_item_list(@last_game["stats"])

    7.times do |i|
      if raw_item_list[i].nil?
        item_list[i].should == "None"
      else
        item_list[i].is_a?(String).should == true
      end 
    end

  end
end
