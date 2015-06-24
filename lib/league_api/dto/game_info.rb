class GameInfo < CommonDto
  attr_accessor :bannedChampions, :gameId, :gameLength, :gameMode, :gameStartTime, :gameType, :mapId, :observers, :participants, :platformId
  def initialize(hash)
    create_banned_champions(hash.delete("bannedChampions")) if hash["bannedChampions"]
    create_participants(hash.delete("participants")) if hash["participants"]
    create_observer(hash.delete("observers"))
    hash.each do |k, v|
      send("#{k}=", v)
    end
  end

  private
  def create_banned_champions(array)
    @bannedChampions = array.map{ |hash| BannedChampion.new(hash) }
  end

  def create_participants(array)
    @participants = array.map { |hash| CurrentGameParticipant.new(hash) }
  end

  def create_observer(hash)
    @observers = Observer.new(hash)
  end
end
