require 'spec_helper'
require 'pry'

describe LeagueApi::Champion do
  before :all do
    CHAMP_NUM = 122 #As of Patch 4.20.1
		LeagueApi.set_region "na"
  end
	it 'should return correct champion list' do
		list = LeagueApi::Champion.get_list
		list.first["id"].should == 266
		list.size.should == CHAMP_NUM
	end

	it "should only find free to play champions" do
		LeagueApi::Champion.get_free_champs.size.should == 10 #Better than having to update or pull a list
	end
end
