module LeagueApi

  class CurrentGame
    @base_url = "https://na.api.pvp.net/observer-mode/rest/consumer/getSpectatorGameInfo/"

    def self.make_request(str, params=nil, region=nil)
      LeagueApi.make_request(@base_url, str, params, region)
    end

    def self.fetch(platformId, summonerId, region="na")
      make_request("#{platformId}/#{summonerId}", nil, region)
    end

    def self.requests
      %w( fetch(platformId,summonerId,region) )
    end
  end
end
