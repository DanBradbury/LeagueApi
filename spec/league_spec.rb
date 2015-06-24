require 'spec_helper'

describe LeagueApi::League do
  context "Riot API Spec" do
  end
  #TODO: replace with a reliable test (if player goes inactive this test will fail)
	#it "should return leagues + entrys given a valid summonerid" do
		#LeagueApi::League.by_summoner(25087996).should_not == nil
		#LeagueApi::League.entry_by_summoner(25087996).should_not == nil
	#end

  #TODO: replace with a reliable test (if player goes inactive this test will fail)
	#it "should raise an error if a summoner has not joined any leagues" do
		#expect {LeagueApi::League.by_summoner(25258182)}.to raise_error(OpenURI::HTTPError)
		#expect {LeagueApi::League.entry_by_summoner(25258182)}.to raise_error(OpenURI::HTTPError)
	#end

  #TODO: replace with a reliable test (if team goes inactive this test will fail)
	#it "should find league by team_id" do
		#LeagueApi::League.get_challenger.should_not == nil
		#LeagueApi::League.by_team("TEAM-444b4a90-5fd3-11e3-8234-782bcb4d1861").should_not == nil
	#end

	it "should fetch challenger league" do
		LeagueApi::League.get_challenger.should_not == nil
		LeagueApi::League.get_challenger("RANKED_TEAM_3x3").should_not == nil
	end

end
