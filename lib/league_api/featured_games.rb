module LeagueApi

  class FeaturedGames
    @base_url = "https://na.api.pvp.net/observer-mode/rest/featured"

    def self.fetch(region="na")
      LeagueApi.make_request(@base_url, "", nil, region)
    end

    def self.requests
      %w( fetch(region) )
    end
  end
end
