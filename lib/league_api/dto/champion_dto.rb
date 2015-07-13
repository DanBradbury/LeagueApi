class ChampionDto
  attr_accessor :active, :botEnabled, :botMmEnabled, :freeToPlay, :id, :rankedPlayEnabled,
    :allytips,:blurb, :enemytips, :image, :info, :key, :lore, :name, :partype, :passive, :recommended, :skins, :spells, :stats, :tags, :title 
  def initialize(champions_hash={}) champions_hash.each do |k, v|
      send("#{k}=", v) end
  end
end
