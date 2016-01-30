require 'spec_helper'

describe LeagueApi::Stats do
	it "shouldn't fetch ranked stats for a in/valid player" do
		LeagueApi::Stats.ranked(25087996).should_not == nil
		#Insert frozen summoner here to check invalid state
	end

	it "should fetch stats summary for a valid player id" do
		LeagueApi::Stats.summary(25087996).should_not == nil
	end
end