class GameDto < CommonDto
  attr_accessor :championId, :createDate, :fellowPlayers, :gameId, :gameMode, :gameType, :invalid, :ipEarned, :level, :mapId, :spell1, :spell2, :stats, :subType, :teamId
  def initialize(hash)
    create_fellow_players(hash.delete("fellowPlayers"))
    create_raw_stats(hash.delete("stats"))
    super(hash)
  end

  private
  def create_fellow_players(array)
    # possible to have a game against AI where there will be no fellow players
    @fellowPlayers = array.nil? ? [] : array.map { |hash| PlayerDto.new(hash) }
  end

  def create_raw_stats(hash)
    @stats = RawStatsDto.new(hash)
  end
end
