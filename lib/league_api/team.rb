module LeagueApi

  class Team

    @base_url = 'https://na.api.pvp.net/api/lol/na/v2.4/team/'

    # Return all publically available requests for current class
    def self.requests
      %w( by_summoner(summoner_id) find_teams(team_ids) )
    end

    def self.make_request(str, region=nil)
      LeagueApi.make_request(@base_url, str, nil, region)
    end

    # Request /api/lol/{region}/v2.3/team/by-summoner/{summonerIds} 
    def self.by_summoner(id, region=nil)
      make_request('by-summoner/'+id.to_s, region)
    end

    # Request /api/lol/{region}/v2.3/team/{teamIds}
    def self.find_teams(str, region=nil)
      make_request(str.gsub(" ",""), region)
    end

  end

end
