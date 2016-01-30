# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "league_api"
  spec.version       = "0.9.0"
  spec.authors       = ["DanBradbury"]
  spec.email         = ["dan.luckydaisy@gmail.com"]
  spec.summary       = %q{Easy access to Riot Developer API}
  spec.description   = %q{Gem to access Riot Developer APIs in a simple and straightforward manner for any Ruby developer.}
  spec.homepage      = "http://danbradbury.github.io/LeagueApi/"
  spec.license       = "MIT"

  spec.files         = Dir['./lib/league_api/*.rb']+['lib/league_api.rb']
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 2.10"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "pry", "~> 0.9"
end
