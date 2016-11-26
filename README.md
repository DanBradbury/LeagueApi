LeagueApi
==========

Version 0.9.0

[![Build Status](https://travis-ci.org/DanBradbury/LeagueApi.svg?branch=master)](https://travis-ci.org/DanBradbury/LeagueApi)  [![Code Climate](https://codeclimate.com/github/DanBradbury/LeagueApi.png)](https://codeclimate.com/github/DanBradbury/LeagueApi)

So you have a Riot Developer API key and are a Ruby developer that would like to get started with minimal headache. LeagueApi is built with you in mind and to make interactions as painless as possible.

Install
-------

    gem install league_api
    export LOL_KEY="your-key-here" #makes it easy to use a different key in production vs development

Quick Example
------
    $ irb
    irb(main):001:0> require "league_api"
    => true
    irb(main):002:0> LeagueApi::Summoner.find_by_name("I six pool") #try out your summoner name :D
    => {"id"=>25087996, "name"=>"I Six Pool", "profileIconId"=>506, "summonerLevel"=>30, "revisionDate"=>1425789701000}
    irb(main):003:0> LeagueApi.available_requests # or view the section below
    => {LeagueApi=>["make_request", "available_requests", "get_champion_names", "get_item_names", "get_summoner_id", "get_last_game_played", "get_last_champion_played", "get_time_of_last_game"], LeagueApi::Champion=>["get_list", "get_free_champs", "get_by_id(champion_id)"], LeagueApi::Static=>["get_champion_list", "get_inverted_champion_list", "get_champion_by_name(champ_id)", "get_item_list", "get_item_by_id", "get_mastery_list", "get_mastery_by_id", "get_realm", "get_rune_list", "rune_by_id(id)", "get_summoner_spells", "get_summoner_by_id(id)", "get_versions", "get_item_image", "get_champion_image", "get_summoner_image"], LeagueApi::Game=>["recent_games(summoner_id)"], LeagueApi::Summoner=>["find_by_name(summoner_name)", "find_summoners(summoner_id_list)", "get_masteries(ids)", "get_names(ids)", "get_runes(ids)"], LeagueApi::League=>["by_summoner(id)", "entry_by_summoner(id)", "by_team(team_id)",
    "entry_by_team(team_id)", "get_challenger(queue=\"RANKED_SOLO_5x5\")"], LeagueApi::Team=>["by_summoner(summoner_id)", "find_teams(team_ids)"], LeagueApi::Stats=>["ranked(summoner_id)", "summary(summoner_id)"], LeagueApi::Util=>["organize_players(player_list)", "get_game_stats(game_stats_hash)"]}
    # gl & hf :P

####Battle Testing On

> [DoTheyWard.com](http://www.dotheyward.com)

## Contributing

If you find any issues or have ideas for improvement please submit a PR and I'd love to get it merged in and make the gem better.

