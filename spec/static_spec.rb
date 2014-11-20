require 'spec_helper'

describe LeagueApi::Static do

	before :all do
		@static = LeagueApi::Static
    REALM_VERSION = "4.19.3"
    GAME_VERSION = "4.20.1"
  end

	it "should get a recent champion list" do
		@static.get_champion_list.first.should == ["Aatrox", {"id"=>266, "key"=>"Aatrox", "name"=>"Aatrox", "title"=>"the Darkin Blade"}]
	end

	it "should return an inverted champion list with ids as the keys" do
		@static.get_inverted_champion_list.first.should == [266, "Aatrox"]
	end

	it "should get champion data from name only" do
		@static.get_champion_by_name("Aatrox").should == {"id"=>266, "key"=>"Aatrox", "name"=>"Aatrox", "title"=>"the Darkin Blade"}
	end

	it "should return an error on bad champion name" do
		expect {@static.get_champion_by_name("Aatox")}.to raise_error
	end

	it "should return data given a proper champion id" do
		@static.get_champion_by_id(266).should == {"id"=>266, "key"=>"Aatrox", "name"=>"Aatrox", "title"=>"the Darkin Blade"}
	end

	it "should get a recent item list" do
		@static.get_item_list.first.should == ["2009", {"id"=>2009, "name"=>"Total Biscuit of Rejuvenation", "description"=>"<consumable>Click to Consume:</consumable> Restores 80 Health and 50 Mana over 10 seconds."}]
	end

	it "should get an item by id" do
		@static.get_item_by_id(2009).should == {"id"=>2009, "name"=>"Total Biscuit of Rejuvenation", "description"=>"<consumable>Click to Consume:</consumable> Restores 80 Health and 50 Mana over 10 seconds."}
	end

	it "should get a list of updated masteries" do
		@static.get_mastery_list.first.should == ["4353", {"id"=>4353, "name"=>"Intelligence", "description"=> ["+2% Cooldown Reduction and reduces the cooldown of Activated Items by 4%",
	"+3.5% Cooldown Reduction and reduces the cooldown of Activated Items by 7%",
	"+5% Cooldown Reduction and reduces the cooldown of Activated Items by 10%"]}]
	end

	it "should get a specific mastery by id" do
		@static.get_mastery_by_id(4353).should == {"id"=>4353, "name"=>"Intelligence", "description"=> ["+2% Cooldown Reduction and reduces the cooldown of Activated Items by 4%",
	"+3.5% Cooldown Reduction and reduces the cooldown of Activated Items by 7%",
	"+5% Cooldown Reduction and reduces the cooldown of Activated Items by 10%"]}
	end

	it "should get current realm information" do
		@static.get_realm["v"].should == REALM_VERSION
		@static.get_realm["l"].should == "en_US"
		@static.get_realm["cdn"].should == "http://ddragon.leagueoflegends.com/cdn"
	end

	it "should get current rune list" do
		@static.get_rune_list.first.should == ["5235", {"id"=>5235, "name"=>"Quintessence of Ability Power", "description"=>"+3.85 ability power", "rune"=>{"isRune"=>true, "tier"=>"2", "type"=>"black"}}]
	end

	it "should get runes by id" do
		@static.get_rune_by_id(5235).should == {"id"=>5235, "name"=>"Quintessence of Ability Power", "description"=>"+3.85 ability power", "rune"=>{"isRune"=>true, "tier"=>"2", "type"=>"black"}}
	end

	it "should get current summoner spells" do
		@static.get_summoner_spells.first.should == ["SummonerBoost", {"name"=>"Cleanse", "description"=> "Removes all disables and summoner spell debuffs affecting your champion and lowers the duration of incoming disables by 65% for 3 seconds.", "summonerLevel"=>2, "id"=>1, "key"=>"SummonerBoost"}]
	end

	it "should get summoner spell by id" do
		@static.get_summoner_by_id(1)["name"].should == "Cleanse"
	end

	it "should get the current versions of the game" do
		@static.get_versions.first.should == GAME_VERSION
	end

	it "should get the ddragon image url for the given item id" do
		@static.get_item_image(2009).should == "http://ddragon.leagueoflegends.com/cdn/#{REALM_VERSION}/img/item/2009.png"
	end

	it "should get the ddragon image url for a given champion name" do
		@static.get_champion_image("Aatrox").should == "http://ddragon.leagueoflegends.com/cdn/#{REALM_VERSION}/img/champion/Aatrox.png"
	end

	it "should get the summoner image from ddragon cdn" do
		@static.get_summoner_image(0).should == "http://ddragon.leagueoflegends.com/cdn/#{REALM_VERSION}/img/sprite/spell0.png"
	end

end
