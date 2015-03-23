# LeagueApi

[![Build Status](https://travis-ci.org/DanBradbury/LeagueApi.svg?branch=master)](https://travis-ci.org/DanBradbury/LeagueApi)  [![Code Climate](https://codeclimate.com/github/DanBradbury/LeagueApi.png)](https://codeclimate.com/github/DanBradbury/LeagueApi) [![Gem Version](https://badge.fury.io/rb/league_api.svg)](http://badge.fury.io/rb/league_api) [![Inline docs](http://inch-ci.org/github/DanBradbury/LeagueApi.png?branch=master)](http://inch-ci.org/github/DanBradbury/LeagueApi)

league_api is meant to provide a simple solution for anyone looking to use Riot's Developer APIs in a Ruby application.

## Installation & Getting Started

    #in your shell
    gem install league_api
    export LOL_KEY="your-key-here" #ideally just add this to your ~/.bashrc
    $ irb                                                                                                                                                                                                        2.1.2
    irb(main):001:0> require "league_api"
    => true
    # Time to play experiment :D

### Supported API Operations
> [BR, EUNE, EUW, KR, LAN, LAS, NA, OCE, RU, TR]

* champion-v1.2

|             |             |
|-------------|-------------|
| /api/lol/{region}/v1.2/champion | Retrieve all champions |
| /api/lol/{region}/champion/{id} | Retrieve champion by ID |


* game-v1.3

|             |             |
|-------------|-------------|
| /api/lol/{region}/v1.3/game/by-summoner/{summonerId}/recent | Get recent games by summoner ID. |

* league-v2.5

|             |             |
|-------------|-------------|
| /api/lol/{region}/v2.5/league/by-summoner/{summonerIds} | Get leagues mapped by summoner ID for a given list of summoner IDs. |
| /api/lol/{region}/v2.5/league/by-summoner/{summonerIds}/entry | Get league entries mapped by summoner ID for a given list of summoner IDs. |
| /api/lol/{region}/v2.5/league/by-team/{teamIds} | Get leagues mapped by team ID for a given list of team IDs. |
| /api/lol/{region}/v2.5/league/by-team/{teamIds}/entry | Get league entries mapped by team ID for a given list of team IDs. |
| /api/lol/{region}/v2.5/league/challenger | Get challenger tier leagues. |

* lol-static-data-v1.2

|             |             |
|-------------|-------------|
| /api/lol/static-data/{region}/v1.2/champion | Retrieves champion list. |
| /api/lol/static-data/{region}/v1.2/champion/{id} | Retrieves a champion by its id. |
| /api/lol/static-data/{region}/v1.2/item | Retrieves item list. |
| /api/lol/static-data/{region}/v1.2/item/{id} | Retrieves item by its unique id. |
| /api/lol/static-data/{region}/v1.2/language-strings | Retrieve language strings data. |
| /api/lol/static-data/{region}/v1.2/languages | Retrieve supported languages data. |
| /api/lol/static-data/{region}/v1.2/map | Retrieve map data. |
| /api/lol/static-data/{region}/v1.2/mastery | Retrieves mastery list. |
| /api/lol/static-data/{region}/v1.2/mastery/{id} | Retrieves mastery item by its unique id. |
| /api/lol/static-data/{region}/v1.2/realm | Retrieve realm data. |
| /api/lol/static-data/{region}/v1.2/rune | Retrieves rune list. |
| /api/lol/static-data/{region}/v1.2/rune/{id} | Retrieves rune by its unique id. |
| /api/lol/static-data/{region}/v1.2/summoner-spell | Retrieves summoner spell list. |
| /api/lol/static-data/{region}/v1.2/summoner-spell/{id} | Retrieves summoner spell by its unique id. |
| /api/lol/static-data/{region}/v1.2/versions | Retrieve version data. |

* stats-v1.3

|             |             |
|-------------|-------------|
| /api/lol/{region}/v1.3/stats/by-summoner/{summonerId}/ranked | Get ranked stats by summoner ID. |
| /api/lol/{region}/v1.3/stats/by-summoner/{summonerId}/summary | Get player stats summaries by summoner ID. |

* summoner-v1.4

|             |             |
|-------------|-------------|
| /api/lol/{region}/v1.4/summoner/by-name/{summonerNames} | Get summoner objects mapped by standardized summoner name for a given list of summoner names. |
| /api/lol/{region}/v1.4/summoner/{summonerIds} | Get summoner objects mapped by summoner ID for a given list of summoner IDs. |
| /api/lol/{region}/v1.4/summoner/{summonerIds}/masteries | Get mastery pages mapped by summoner ID for a given list of summoner IDs |
| /api/lol/{region}/v1.4/summoner/{summonerIds}/name | Get summoner names mapped by summoner ID for a given list of summoner IDs. |
| /api/lol/{region}/v1.4/summoner/{summonerIds}/runes | Get rune pages mapped by summoner ID for a given list of summoner IDs. |


* team-v2.4

|             |             |
|-------------|-------------|
| /api/lol/{region}/v2.4/team/by-summoner/{summonerIds} | Get teams mapped by summoner ID for a given list of summoner IDs. |
| /api/lol/{region}/v2.4/team/{teamIds} | Get teams mapped by team ID for a given list of team IDs. |

### Currently Unsupported API Operations
> Will be updated until all APIs are fully supported

* current-game-v1.0

|             |             |
|-------------|-------------|
| /observer-mode/rest/consumer/getSpectatorGameInfo/{platformId}/{summonerId} | Get current game information for the given summoner ID |

* feature-games-v1.0

|             |             |
|-------------|-------------|
| /observer-mode/rest/featured | Get list of featured games. |

* lol-status-v1.0

|             |             |
|-------------|-------------|
| /shards | Get shard list. |
| /shards/{region} | Get shard status. Returns the data available on the status.leagueoflegends.com website for the given region. |

* match-v2.2

|             |             |
|-------------|-------------|
| /api/lol/{region}/v2.2/match/{matchId} | Retrieve match by match ID. |

* matchhistory-v2.2

|             |             |
|-------------|-------------|
| /api/lol/{region}/v2.2/matchhistory/{summonerId} | Retrieve match history by summoner ID. |


#### Getting Started
    LeagueApi.available_requests # I prefer to use pry for this because of the hash pretty hash formatting
    =>
      LeagueApi::Game=>["recent_games(summoner_id)"],
      LeagueApi::Summoner=>["find_by_name(summoner_name)", "find_summoners(summoner_id_list)", "get_masteries(ids)", "get_names(ids)", "get_runes(ids)"],
      LeagueApi::League=>["by_summoner(id)", "entry_by_summoner(id)", "by_team(team_id)", "entry_by_team(team_id)", "get_challenger(queue=\"RANKED_SOLO_5x5\")"],
      LeagueApi::Team=>["by_summoner(summoner_id)", "find_teams(team_ids)"],
      LeagueApi::Stats=>["ranked(summoner_id)", "summary(summoner_id)"],
      LeagueApi::Util=>["organize_players(player_list)", "get_game_stats(game_stats_hash)"]

    # Using these methods is as simple as following the guidlines specified on Riot's official docs

####Battle Testing On

> [DoTheyWard.com](www.dotheyward.com)

## Contributing

Is very much appreciated so feel free to submit a PR and we can see if we can get it merged in.

