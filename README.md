# LeagueApi

[![Build Status](https://travis-ci.org/DanBradbury/LeagueApi.svg?branch=master)](https://travis-ci.org/DanBradbury/LeagueApi)  [![Code Climate](https://codeclimate.com/github/DanBradbury/LeagueApi.png)](https://codeclimate.com/github/DanBradbury/LeagueApi) [![Gem Version](https://badge.fury.io/rb/league_api.svg)](http://badge.fury.io/rb/league_api)

A 1-1 mapping of the Riot Developer APIs to a Ruby Gem with a convenient abstraction to get the most from the API (always growing).

## Installation

    gem install league_api

## Usage
In order to use the API you must have a developer key which can be obtained at (https://developer.riotgames.com/):

    export LOL_KEY="your-key"

Once you set the LOL_KEY (will be changing to API_KEY in the near future) you can start to play with the API methods that Riot provides (https://developer.riotgames.com/api/methods).

####Available Methods

`$ LeagueApi.available_requests` will return all requests that can be made

Since the API returns JSON there is typically more information than we typically want. Because of this there are / will be more, *convenience methods* available.

    LeagueApi.get_champion_list #Fetch array of champions names
    LeagueApi [ get_item_names, get_summoner_id(name), last_game_played(summoner_id) ]

Right now there are not many methods available
## Contributing

Is very much appreciated so feel free to submit a PR and we can see if we can get it merged in.

