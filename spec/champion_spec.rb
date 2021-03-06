require 'spec_helper'

describe LeagueApi::Champion do
  before :all do
    CHAMP_NUM = 129 # Been a while since i've logged in so im not sure who the latest champ is now..
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
