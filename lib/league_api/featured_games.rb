module LeagueApi

  class FeaturedGames
    @base_url = "https://na.api.pvp.net/observer-mode/rest/featured"
    class << self
      # Riot API Spec Start
      # Returns: FeaturedGames
      def featured(region="na")
        FeaturedGamesDto.new(LeagueApi.make_request(@base_url, "", nil, region))
      end
      # Riot API Spec End

      def fetch(region="na")
        LeagueApi.make_request(@base_url, "", nil, region)
      end

      def requests
        %w( fetch(region) )
      end
    end
  end
end
