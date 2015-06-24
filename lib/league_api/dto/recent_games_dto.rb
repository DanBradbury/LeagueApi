class RecentGamesDto < CommonDto
  attr_accessor :games, :summonerId
  def initialize(hash)
    create_games(hash.delete("games"))
    super(hash)
  end

  private
  def create_games(array)
    @games = array.map { |hash| GameDto.new(hash) }
  end
end
