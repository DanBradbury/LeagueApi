require 'json'
require 'open-uri'
require 'league_api/champion'
require 'league_api/static'
require 'league_api/game'
require 'league_api/summoner'
require 'league_api/league'
require 'league_api/team'
require 'league_api/stats'
require 'league_api/util'

module LeagueApi
  extend self

  @api_key = ENV["LOL_KEY"]
  #XXX: Would rather have this generated by Static.get_versions
  $version = "4.9.1"
  
  @@default_region = "na"

  def make_request(base, modifier=nil, params=nil, region=nil)
    region = @@default_region if region.nil?
    base = LeagueApi.change_base(base, region)

    url = base + modifier

    if params

      params.each do |p|
        url << '?'+p[0]+'='+p[1]
      end
      url += '&api_key=' + @api_key

    else

      url += '?api_key=' + @api_key

    end

    uri = URI.parse(url)
    JSON.parse(uri.read)
  end

  def default_region
    @@default_region
  end

  def change_region(region)
    @@default_region = region
  end

  def set_region(name)
    $region = name
  end

  def get_region(region)
    if region.nil?
      $region
    else
      region
    end
  end

  def change_base(url, region)
    case region
    when "euw"
      url.gsub("prod.api.pvp.net","euw.api.pvp.net").gsub("na","euw")
    when "br"
      url.gsub("prod.api.pvp.net","br.api.pvp.net").gsub("na","br")
    when "eune"
      url.gsub("prod.api.pvp.net","eune.api.pvp.net").gsub("na","eune")
    when "kr"
      url.gsub("prod.api.pvp.net","kr.api.pvp.net").gsub("na","kr")
    when "las"
      url.gsub("prod.api.pvp.net","las.api.pvp.net").gsub("na","las")
    when "lan"
      url.gsub("prod.api.pvp.net","lan.api.pvp.net").gsub("na","lan")
    when "oce"
      url.gsub("prod.api.pvp.net","oce.api.pvp.net").gsub("na","oce")
    when "tr"
      url.gsub("prod.api.pvp.net","tr.api.pvp.net").gsub("na","tr")
    when "ru"
      url.gsub("prod.api.pvp.net","ru.api.pvp.net").gsub("na","ru")
    else
      url #Cause USA #1
    end
  end

  #Display all available Requests for all API classes
  def available_requests
    c = self.constants
    requests = {}

    requests[LeagueApi] = self.instance_methods.map &:to_s

    c.each do |i|
      requests[eval(i.to_s)] = eval(i.to_s).requests
    end

    requests
  end

  # Returns an array of champion names
  def get_champion_names
    Static.get_champion_list.keys
  end

  # Returns an array of item names
  def get_item_names
    items = []
    Static.get_item_list.values.each do |f|
      items << f["name"]
    end
    items
  end

  # Return player id given the summoner name
  def get_summoner_id(str, region=nil)
    Summoner.find_by_name(str, region)["id"]
  end

  # Return unformatted JSON of the last game played
  def get_last_game_played(id, region=nil)
    Game.recent_games(id, region).first
  end

  # Return a String for the last champion played
  def get_last_champion_played(id, region=nil)
    champ_id = Game.recent_games(id, region).first["championId"]
    Static.get_inverted_champion_list[champ_id]
  end

  # Return the Time for the last played game
  def get_time_of_last_game(id, region=nil)
    Time.at( Game.recent_games(id, region).first["createDate"] / 1000 )
  end

end
