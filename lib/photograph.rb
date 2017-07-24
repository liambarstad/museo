class Photograph
  def initialize(name:, artist_id:, museum_id:, year:)
    @id = 1
    @name = name
    @artist_id = artist_id
    @museum_id = museum_id
    @year = year
  end

  def name
    @name
  end

  def artist_id
    @artist_id
  end

  def museum_id
    @museum_id
  end

  def year
    @year
  end
end
