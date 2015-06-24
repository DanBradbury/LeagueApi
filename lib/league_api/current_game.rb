module LeagueApi

  class CurrentGame
    @base_url = "https://na.api.pvp.net/observer-mode/rest/consumer/getSpectatorGameInfo/"

    class << self
      # Riot API Spec Start
      # Returns: CurrentGameInfo object
      def get_spectator_game_info(platformId, summonerId, region="na")
        CurrentGameInfo.new(make_request("#{platformId}/#{summonerId}", nil, region))
      end
      # Riot API Spec END
      def make_request(str, params=nil, region=nil)
        LeagueApi.make_request(@base_url, str, params, region)
      end

      def requests
        %w( fetch(platformId,summonerId,region) )
      end
    end
  end
end
