module LeagueApi
  class League
    @base_url = 'https://na.api.pvp.net/api/lol/na/v2.5/league/'

    class << self
      # Riot API Spec Start
      # Returns: Hash[String, Array[LeagueDto]]
      def by_summoner(id, region=nil)
        make_request('by-summoner/'+id.to_s, nil, region)
      end
      # Riot API Spec End
      def make_request(str, params=nil, region=nil)
        LeagueApi.make_request(@base_url, str, params, region)
      end


      def entry_by_summoner(id, region=nil)
        make_request('by-summoner/'+id.to_s+'/entry', nil, region)
      end

      def by_team(id, region=nil)
        make_request('by-team/'+id.to_s, nil, region)
      end

      def entry_by_team(id, region=nil)
        make_request('by-team/'+id.to_s+'/entry', nil, region)
      end

      def get_challenger(queue="RANKED_SOLO_5x5", region=nil)
        params = {"type" => queue}
        make_request('challenger', params, region)
      end

      def requests
        %w( by_summoner(id) entry_by_summoner(id) by_team(team_id) entry_by_team(team_id) get_challenger(queue="RANKED_SOLO_5x5") )
      end
    end
  end

end
