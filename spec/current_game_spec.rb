require 'spec_helper'

describe LeagueApi::CurrentGame do
  before(:all) do
    @platform_mapping = {
      "NA1" => "na",
      "BR1" => "br",
      "LA1" => "lan",
      "LA2" => "las",
      "OC1" => "oce",
      "EUN1" => "eune",
      "TR1" => "tr",
      "RU" => "ru",
      "EUW1" => "euw",
      "KR" => "kr"
    }
  end


  # other regions seem to be unauthorized for the current version of the API
  # TODO: investigate why SSL cers arent working in EU regions...
  ["NA1"].each do |platformId|
    it "should find current game info for a summoner id in #{platformId} region" do
      region = @platform_mapping[platformId]
      games = LeagueApi::FeaturedGames.fetch(region)
      summoner = LeagueApi::Summoner.find_by_name(games["gameList"].first["participants"].first["summonerName"], region)
      @summoner_id = summoner["id"]
      @current_game = LeagueApi::CurrentGame.get_spectator_game_info(platformId, @summoner_id, region)
      @current_game.class.should == CurrentGameInfo
      @current_game.gameId.should_not == nil
      @current_game.bannedChampions.class.should == Array
      @current_game.bannedChampions.first.class.should == BannedChampion
      @current_game.participants.class.should == Array
      participant = @current_game.participants.first
      participant.class.should == CurrentGameParticipant
      # test CurrentGameParticipant model here..
      participant.masteries.class.should == Array
      participant.masteries.first.class.should == Mastery
      participant.runes.class.should == Array
      participant.runes.first.class.should == Rune
      @current_game.observers.class.should == Observer
    end
  end
end
