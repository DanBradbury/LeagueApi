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
require 'league_api/featured_games'
require 'league_api/current_game'

module LeagueApi
  @api_key = ENV["LOL_KEY"]
  @default_region = "na"
  # third party versioning for image cdn (static info)
  $DDRAGON_VERSION = "6.2.1"

  extend self

  def make_request(base, modifier=nil, params=nil, region=nil)
    region = @default_region if region.nil?
    base = change_base(base, region)

    url = base + modifier
    url << add_query_string(params)

    uri = URI.parse(url)
    JSON.parse(uri.read)
  end

  #Display all available Requests for all API classes
  def available_requests
    requests = {}
    requests[LeagueApi] = self.instance_methods.map &:to_s

    self.constants.each do |i|
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

  def before(*methods)
    methods.each do |name|
      m = instance_method(name)
      define_method(name) do |*args, &block|
        yield
        m.bind(self).(*args, &block)
      end
    end
  end


  before(*instance_methods) { ENV["LOL_KEY"] or raise("Must provide an LOL KEY") }

  private

  def add_query_string(params)
    query_string = ""
    if params
      params.each do |p|
        query_string << "?"+p[0]+"="+p[1]
      end
      query_string << "&api_key=" + @api_key
    else
      query_string << "?api_key=" + @api_key
    end
  end

  def change_base(url, region)
    return url if region == "na"
    return url.gsub("na.api.pvp.net", "#{region}.api.pvp.net").gsub("na", region)
  end


end
