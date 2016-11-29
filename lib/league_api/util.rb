module LeagueApi

	class Util

    # Return all publically available requests
    def self.requests
      %w( organize_players(player_list) get_game_stats(game_stats_hash) )
    end

    # Takes fellow_player hash from game info and splits into team 1 and team 2 (prepend lookup team1)
    def self.organize_players(players)
      players.sort! { |x,y| x["teamId"] <=> y["teamId"]}
    end

    # Pass in stats from game info and get an readable stat hash to iterate on
    def self.get_game_stats(game)
      s = {}
      #manually add every stat we want
      s["Gold Earned"] = game["goldEarned"]
      s["Minions Killed"] = game["minionsKilled"]

      s["Total Damage"] = game["totalDamageDealt"]
      s["Total Damage Taken"] = game["totalDamageTaken"]

      s["Killing Sprees"] = game["killingSprees"]
      s["Largest Killing Sprees"] = game["largestKillingSpree"]
      s["Neutral Minions Killed"] = game["neutralMinionsKilled"]
      s["Largest Multikill"] = game["largestMultiKill"]

      s["Physical Damage Dealt"] = game["physicalDamageDealtPlayer"]
      s["Magic Damage Dealt"] = game["magicDamageDealtPlayer"]
      s["Physical Damage To Champions"] = game["physicalDamageDealtToChampions"]
      s["Magic Damage To Champions"] = game["magicDamageDealtToChampions"]
      s["Total Damage To Champions"] = game["totalDamageDealtToChampions"]
      s["True Damage Dealt"] = game["trueDamageDealtPlayer"]
      s["True Damage To Champions"] = game["trueDamageDealtToChampions"]
      s["True Damage Taken"] = game["trueDamageTaken"]
      s["Physical Damage Taken"] = game["physicalDamageTaken"]
      s["Magic Damage Taken"] = game["magicDamageTaken"]
      s["Total Healing"] = game["totalHeal"]

      s["Turrets Killed"] = game["turretsKilled"]
      s["Minions Killed in Enemy Jungle"] = game["neutralMinionsKilledEnemyJungle"]
      s["Minions Killed in Your Jungle"] = game["neutralMinionsKilledYourJungle"]
      s["Gold Spent"] = game["goldSpent"]

      s["Vision Wards Purchased"] = game["visionWardsBought"]
      s["Wards Placed"] = game["wardPlaced"]
      #TODO: Needs a more accurate descriptions (milli seconds)
      s["Crowd Control Dealt"] = game["totalTimeCrowdControlDealt"]

      s
    end

    # fetches list of items from game["stats"]
    # TODO: should be removed / refactored out since this would only be used by get_item_list
    def self.get_raw_item_list(stats)
      item_list =  []

      7.times do |i|
          item_list[i] = stats["item#{i}"]
      end

      item_list
    end

    # Similar to get_raw_item_list but gets the item name from Static data
    # Mostly convenient for getting item names quickly on recent_games
    def self.get_item_list(stats)
      raw_list = get_raw_item_list(stats)
      item_list = []

      7.times do |i|
        if raw_list[i].nil?
          item_list[i] = "None" if raw_list[i].nil?
        else
          item_list[i] = LeagueApi::Static.get_item_by_id(raw_list[i])["name"] if raw_list[i]
        end
      end

      item_list
    end

  end
end
