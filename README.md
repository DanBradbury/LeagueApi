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

#### First Steps
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

