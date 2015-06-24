class FeaturedGamesDto < CommonDto
  attr_accessor :clientRefreshInterval, :gameList
  def initialize(hash)
    create_game_info_list(hash.delete("gameList"))
    super(hash)
  end

  private
  def create_game_info_list(array)
    @gameList = 
      array.nil? ? [] : array.map { |hash| FeaturedGameInfo.new(hash) }
  end
end
