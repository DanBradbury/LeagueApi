require 'spec_helper'

describe LeagueApi::Static do

	before :all do
		@static = LeagueApi::Static
    REALM_VERSION = "6.2.1"
    GAME_VERSION = "6.2.1"
  end

	it "should get a recent champion list" do
		expect(@static.get_champion_list.keys.include?("Thresh")).to be_truthy
	end

	it "should return an inverted champion list with ids as the keys" do
		@static.get_inverted_champion_list.first.should == [412, "Thresh"]
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

  describe "masteries" do
    it "should get a list of masters and then fetch the individual" do
			fetch_id = @static.get_mastery_list.keys.first
			expect(@static.get_mastery_by_id(fetch_id).keys.include?("name")).to be_truthy
    end
  end

  describe "items" do
    it "should get a list of items and an indivual from the list" do
			fetch_id = @static.get_item_list.keys.first
      expect(@static.get_item_by_id(fetch_id).keys.include?("group")).to be_truthy
    end
  end

  describe "runes" do
    it "should fetch list and get individual" do
			fetch_id = @static.get_rune_list.keys.first
      expect(@static.get_rune_by_id(fetch_id).keys.include?("description")).to be_truthy
    end
  end

  describe "summoner spells" do
		it "should fetch list and get individual" do
			fetch_id = @static.get_summoner_spells.first[1]["id"] #weird syntax compared to the others (id not in front..)
			expect(@static.get_summoner_by_id(fetch_id).keys.include?("name")).to be_truthy
    end
	end

	it "should get current realm information" do
		realm_info = @static.get_realm
    realm_info["v"].should == REALM_VERSION
		realm_info["l"].should == "en_US"
		realm_info["cdn"].should == "http://ddragon.leagueoflegends.com/cdn"
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
