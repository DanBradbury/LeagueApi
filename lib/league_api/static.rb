module LeagueApi

  #lol-static-data-v1.2
  class Static
    @base_url = "https://na.api.pvp.net/api/lol/static-data/na/v1.2/"
    class << self
      # Riot API Spec Start
      def champions(region=nil)
        ChampionListDto.new(make_request('champion', region))
      end
      # Riot API Spec End
      def make_request(str, region=nil)
        LeagueApi.make_request(@base_url, str, nil, region)
      end

      # Return a hash of all champions. [name, {data, ..}]
      def get_champion_list(region=nil)
        make_request('champion', region)["data"]
      end

      def get_champion_by_name(name, region=nil)
        make_request('champion', region)["data"].fetch(name)
      end

      def get_champion_by_id(id, region=nil)
        make_request('champion/'+id.to_s, region)
      end

      def get_item_list(region=nil)
        make_request('item', region)["data"]
      end

      def get_item_by_id(id, region=nil)
        make_request('item/'+id.to_s, region)
      end

      def get_mastery_list(region=nil)
        make_request('mastery', region)["data"]
      end

      def get_mastery_by_id(id, region=nil)
        make_request('mastery/'+id.to_s, region)
      end

      def get_realm(region=nil)
        make_request('realm', region)
      end

      def get_rune_list(region=nil)
        make_request('rune', region)["data"]
      end

      def get_rune_by_id(id, region=nil)
        make_request('rune/'+id.to_s, region)
      end

      def get_summoner_spells(region=nil)
        make_request('summoner-spell', region)["data"]
      end

      def get_summoner_by_id(id, region=nil)
        make_request('summoner-spell/'+id.to_s, region)
      end

      def get_versions(region=nil)
        make_request('versions', region)
      end

      def get_inverted_champion_list
        hash = get_champion_list
        r = {}

        hash.each do |e|
          r[ e[1]["id"] ] = e[0]
        end

        r
      end

      #Image CDN supported by ddragon (Runes + Masteries are done on single sprite sheet)
      #TODO: Implement http://ddragon.leagueoflegends.com/cdn/4.7.8/img/sprite/rune0.png

      def get_item_image(id)
        "http://ddragon.leagueoflegends.com/cdn/"+$DDRAGON_VERSION+"/img/item/"+id.to_s+".png"
      end

      def get_champion_image(str)
        "http://ddragon.leagueoflegends.com/cdn/"+$DDRAGON_VERSION+"/img/champion/"+str+".png"
      end

      def get_summoner_image(id)
        "http://ddragon.leagueoflegends.com/cdn/"+$DDRAGON_VERSION+"/img/sprite/spell"+id.to_s+".png"
      end

      def requests
        %w( get_champion_list get_inverted_champion_list get_champion_by_name(champ_id) get_item_list get_item_by_id get_mastery_list get_mastery_by_id get_realm get_rune_list rune_by_id(id) get_summoner_spells get_summoner_by_id(id) get_versions get_item_image get_champion_image get_summoner_image)
      end
    end
  end
end
