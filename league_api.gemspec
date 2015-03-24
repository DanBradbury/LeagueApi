# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "league_api"
  spec.version       = "0.7.2"
  spec.authors       = ["DanBradbury"]
  spec.email         = ["dan.luckydaisy@gmail.com"]
  spec.summary       = %q{Mapping of Riot Developer API with  additional helper methods}
  spec.description   = %q{Gem to access Riot Developer APIs.}
  spec.homepage      = "http://danbradbury.github.io/LeagueApi/"
  spec.license       = "MIT"

  spec.files         = ["lib/league_api.rb", "lib/league_api/champion.rb", "lib/league_api/static.rb", "lib/league_api/game.rb", "lib/league_api/summoner.rb", "lib/league_api/league.rb", "lib/league_api/team.rb", "lib/league_api/stats.rb", "lib/league_api/util.rb", "lib/league_api/current_game.rb", "lib/league_api/featued_games.rb"]
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 2.10"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "pry", "~> 0.9"
end
