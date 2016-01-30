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
      LeagueApi::CurrentGame.fetch(platformId, @summoner_id, region).should_not == nil
      sleep(1) #add this to ensure we dont break any limits
    end
  end
end
