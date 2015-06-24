class ChampionListDto
  attr_accessor :champions
  def initialize(response_hash)
    @champions = translate_to_champion_dto(response_hash["champions"])
  end

  private
  #returns array of ChampionDtos
  def translate_to_champion_dto(champion_array)
    champion_list = []
    champion_array.each { |champion_hash| champion_list << ChampionDto.new(champion_hash) }
    champion_list
  end
end
