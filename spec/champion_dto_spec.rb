require 'spec_helper'

describe ChampionDto do

  it 'should have a set of attributes all set to nil' do
    @champion_dto = ChampionDto.new
    @champion_dto.active.should == nil
    @champion_dto.botEnabled.should == nil
    @champion_dto.botMmEnabled.should == nil
  end

  it 'should initialize all attributes when provied a valid champion has' do
    champ_hash = {"id"=>103, "active"=>true, "botEnabled"=>false, "freeToPlay"=>false, "botMmEnabled"=>false, "rankedPlayEnabled"=>true}
    @champion_dto = ChampionDto.new(champ_hash)
    @champion_dto.active.should == true
  end

  it 'should raise a no method error when searching for an invalid key' do
    @champion_dto = ChampionDto.new
    expect { @champion_dto.somethin_bullshit.should == nil }.to raise_error(NoMethodError)
  end
end
