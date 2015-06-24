module LeagueApi

  class Stats
    @base_url = "https://na.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/"
    class << self
      def make_request(str, params=nil, region=nil)
        LeagueApi.make_request(@base_url, str, params, region)
      end

      def ranked(id, season="SEASON4", region=nil)
        params = {"season" => season}
        make_request(id.to_s+'/ranked', params, region)
      end

      def summary(id, season="SEASON4", region=nil)
        params = {"season" => season}
        make_request(id.to_s+'/summary', params, region)
      end

      def requests
        %w( ranked(summoner_id) summary(summoner_id) )
      end
    end
  end
end
