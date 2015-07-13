require 'spec_helper'

describe LeagueApi::Champion do
  before :all do
    CHAMP_NUM = 126
  end

  context 'Riot API Champion Spec' do
    it 'should return a ChampionListDto when requesting champions index' do
      list = LeagueApi::Champion.index
      list.class.should == ChampionListDto
      #testing the ChampionListDto..cajun style..
      list.champions.class.should == Array
      list.champions.first.class.should == ChampionDto
    end

    it 'should return a ChampionListDto for free champions when supplying freeToPlay params' do
      list = LeagueApi::Champion.free_champs
      list.class.should == ChampionListDto
    end

    it 'should return a specific ChampionDto when using show w/ integer id' do
      champion = LeagueApi::Champion.show(1)
      champion.class.should == ChampionDto
      champion.active.should == true
    end

    it 'should return a specific ChampionDto when using show w/ string id' do
      champion = LeagueApi::Champion.show('1')
      champion.class.should == ChampionDto
      champion.active.should == true
    end

    it 'should fail gracefully when supplying a bad id' do
      expect { LeagueApi::Champion.show('tupac') }.to raise_error(StandardError)
    end
  end

  context 'additional helper methods' do
    it 'should return correct champion list' do
      list = LeagueApi::Champion.get_list
      list.class.should == Array
      list.first.class.should == ChampionDto
      list.first.id.should == 266
      list.size.should == CHAMP_NUM
    end

    it "should only find free to play champions" do
      LeagueApi::Champion.get_free_champs.size.should == 10 #Better than having to update or pull a list
    end
  end
end

