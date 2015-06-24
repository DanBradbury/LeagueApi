module LeagueApi

  class Champion
    @base_url = "https://na.api.pvp.net/api/lol/na/v1.2/"

    class << self
      def make_request(str, params=nil, region=nil)
        LeagueApi.make_request(@base_url, str, params, region)
      end

      # Riot API Spec Start
      # Returns: ChampionListDto
      def index(region=nil)
        champions(region,nil)
      end

      # Returns: ChampionListDto
      def free_champs(region=nil)
        champions(region, {"freeToPlay" => "true"})
      end

      # Returns: ChampionDto
      def show(id, region=nil)
        champion(id, region)
      end
      # Riot API Spec END

      # Returns an array of ChampionDtos
      def get_free_champs(region=nil)
        free_champs(region).champions
      end

      # Returns an array of ChampionDtos
      def get_list(region=nil)
        index(region).champions
      end


      def requests
        %w( get_list get_free_champs get_by_id(champion_id) )
      end

      private
      def champion(id, region=nil)
        ChampionDto.new(make_request('champion/'+id.to_s, nil, region))
      end

      def champions(region=nil, params=nil)
        ChampionListDto.new(make_request('champion', params, region))
      end
    end
  end
end
