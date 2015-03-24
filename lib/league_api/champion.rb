module LeagueApi

  class Champion
    @base_url = "https://na.api.pvp.net/api/lol/na/v1.2/"

    def self.make_request(str, params=nil, region=nil)
      LeagueApi.make_request(@base_url, str, params, region)
    end

    def self.get_free_champs(region=nil)
      params = {"freeToPlay" => "true"}
      make_request('champion', params, region)["champions"]
    end

    def self.get_list(region=nil)
      make_request('champion', nil, region)["champions"]
 	  end

    def self.get_by_id(id, region=nil)
      make_request('champion/'+id.to_s, nil, region)
    end

    def self.requests
      %w( get_list get_free_champs get_by_id(champion_id) )
    end

  end

end
