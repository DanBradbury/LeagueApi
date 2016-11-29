module LeagueApi

  class Summoner

    @base_url = 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/'

    def self.make_request(str, region=nil)
      LeagueApi.make_request(@base_url, str, nil, region)
    end

    # Get summoner objects mapped by standardized summoner name for a given list of summoner names. 
    # Request /api/lol/{region}/v1.4/summoner/by-name/{summonerNames}
    def self.find_by_name(name, region=nil)
      @name = URI.escape(name, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
      make_request('by-name/'+@name,region)[name.gsub(" ", "").downcase]
    end

    # Get Summoner Objects mapped by summoner ID for a given a comma seperated list of summoner IDs
    # Request /api/lol/{region}/v1.4/summoner/{summonerIds}
    def self.find_summoners(str, region=nil)
      make_request(str.gsub(" ", ""), region)
    end

    # Get mastery pages mapped by summoner ID for a given list of summoner IDs
    # Request /api/lol/{region}/v1.4/summoner/{summonerIds}/masteries
    def self.get_masteries(summoners, region=nil)
      make_request(summoners.gsub(" ", "")+'/masteries', region)
    end

    # Get summoner names mapped by summoner ID for a given list of summoner IDs
    # /api/lol/{region}/v1.4/summoner/{summonerIds}/name
    def self.get_names(summoners, region=nil)
      make_request(summoners.gsub(" ", "")+'/name', region)
    end

    # Get rune pages mapped by summoner ID for a given list of summoner IDs
    # /api/lol/{region}/v1.4/summoner/{summonerIds}/runes
    def self.get_runes(summoners, region=nil)
      make_request(summoners.gsub(" ", "")+'/runes', region)
    end

    def self.requests
      %w( find_by_name(summoner_name) find_summoners(summoner_id_list) get_masteries(ids) get_names(ids) get_runes(ids) )
    end

  end

end
