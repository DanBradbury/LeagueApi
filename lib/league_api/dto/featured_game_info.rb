class FeaturedGameInfo < GameInfo
  attr_accessor :gameQueueConfigId
  def initialize(hash)
    create_banned_champions(hash.delete("bannedChampions"))
    create_participants(hash.delete("participants"))
    create_observer(hash.delete("observers"))
    hash.each do |k, v|
      send("#{k}=", v)
    end
  end

  private
  def create_participants(array)
    @participants = array.map { |hash| Participant.new(hash) }
  end
end
