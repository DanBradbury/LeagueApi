require 'spec_helper'

describe LeagueApi::Summoner do

	before(:all) do
		@summoner = LeagueApi::Summoner
	end

	it "should find summoner by name" do
		@summoner.find_by_name('VG Manfish')["id"].should == 22914691
		@summoner.find_by_name('hellaninja')["name"].should == "Hellaninja"
		@summoner.find_by_name('Pablô', "euw")["id"].should == 31821331
		@summoner.find_by_name('Sayó', "eune")["id"].should == 21749000
		@summoner.find_by_name('Raâziel', "tr")["id"].should == 530375
		#@summoner.find_by_name('Китай тиран', "ru")["id"].should == 12312 
		@summoner.find_by_name('Ke Yi Cao Ni Ma', "oce")["id"].should == 327638
		@summoner.find_by_name('Chingon', "las")["id"].should == 553880
		@summoner.find_by_name('ChingoN', "lan")["id"].should == 199926
		sleep 5
	end

	it "should find summoners given a comma seperated list of ids" do
		@summoner.find_summoners("25087996, 28374180").size.should == 2
	end

	it "should find masteries given a summoner list" do
		@summoner.get_masteries("25087996, 28374180").fetch("25087996")["pages"].first["name"].should == "RANGED ADC"
	end

	it "should find the summoner names given list of ids" do
		@summoner.get_names("25087996, 28374180").fetch("25087996").should == "I Six Pool"
	end

	it "should find runes given list of ids" do
		@summoner.get_runes("25087996, 28374180").fetch("25087996")["pages"].first["name"].should == "3s JUNGLE"
	end
end
