class ChampionDto
  attr_accessor :active, :botEnabled, :botMmEnabled, :freeToPlay, :id, :rankedPlayEnabled
  def initialize(champions_hash={})
    champions_hash.each do |k, v|
      send("#{k}=", v)
    end
  end
end
