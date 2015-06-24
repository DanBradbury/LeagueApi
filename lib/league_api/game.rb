module LeagueApi
	class Game
		@base_url = "https://na.api.pvp.net/api/lol/na/v1.3/game/by-summoner/"
    class << self
      # Riot API Spec Start
      # Returns: RecentGamesDto
      def recent(summoner_id, region=nil)
        RecentGamesDto.new(make_request(summoner_id.to_s+'/recent', region))
      end
      # Riot API Spec End

      def make_request(str, region=nil)
        LeagueApi.make_request(@base_url, str, nil, region)
      end

      def recent_games(id, region=nil)
        make_request(id.to_s+'/recent', region)["games"]
      end

      def requests
        %w( recent_games(summoner_id) )
      end
    end
	end
end
