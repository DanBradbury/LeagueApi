class CurrentGameParticipant < CommonDto
  attr_accessor :bot, :championId, :masteries, :profileIconId, :runes, :spell1Id, :spell2Id, :summonerId, :summonerName, :teamId
  def initialize(hash)
    create_masteries(hash.delete("masteries"))
    create_runes(hash.delete("runes"))
    super(hash)
  end

  private
  def create_masteries(array)
    @masteries = 
      array.nil? ?  [] : array.map{ |hash| Mastery.new(hash) }
  end

  def create_runes(array={})
    @runes = 
      array.nil? ? [] : array.map { |hash| Rune.new(hash) }
  end
end
