class CommonDto
  def initialize(hash)
    hash.each do |k,v|
      send("#{k}=", v)
    end
  end
end
