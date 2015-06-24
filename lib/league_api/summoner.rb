module LeagueApi
  class Summoner
    @base_url = 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/'

    class << self
      def make_request(str, region=nil)
        LeagueApi.make_request(@base_url, str, nil, region)
      end

      def find_by_name(name, region=nil)
        @name = URI.escape(name, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
        make_request('by-name/'+@name,region)[name.gsub(" ", "").downcase]
      end

      # Get Summoner Objects mapped by summoner ID for a given a comma seperated list of summoner IDs
      def find_summoners(str, region=nil)
        make_request(str.gsub(" ", ""), region)
      end

      def get_masteries(summoners, region=nil)
        make_request(summoners.gsub(" ", "")+'/masteries', region)
      end

      def get_names(summoners, region=nil)
        make_request(summoners.gsub(" ", "")+'/name', region)
      end

      def get_runes(summoners, region=nil)
        make_request(summoners.gsub(" ", "")+'/runes', region)
      end

      def requests
        %w( find_by_name(summoner_name) find_summoners(summoner_id_list) get_masteries(ids) get_names(ids) get_runes(ids) )
      end
    end
  end
end
