class ChampionListDto < CommonDto
  attr_accessor :champions, :data, :format, :keys, :type, :version
  def initialize(response_hash)
    @champions = translate_to_champion_dto(response_hash.delete("champions")) if response_hash["champions"]
    @data = fixup_data(response_hash.delete("data")) if response_hash["data"]
    super(response_hash)
  end

  private
  def fixup_data(hash)
    fixed = {}
    hash.each{ |k,v| fixed[k] = ChampionDto.new(v) }
    fixed
  end
  #returns array of ChampionDtos
  def translate_to_champion_dto(champion_array)
    champion_list = []
    champion_array.each { |champion_hash| champion_list << ChampionDto.new(champion_hash) }
    champion_list
  end
end
