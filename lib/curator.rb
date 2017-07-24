require './lib/photograph'
require './lib/artist'
require './lib/museum'


class Curator
  attr_reader :artists, :museums, :photographs
  def initialize
    @artists = []
    @museums = []
    @photographs = []
  end

  def add_artist(name:, born:, died:, country:)
    @artists << Artist.new({name: name, born: born, died: died, country: country})
  end

  def add_photograph(name:, artist_id:, museum_id:, year:)
    @photographs << Photograph.new({name: name, artist_id: artist_id, museum_id: museum_id, year: year})
  end

  def add_museum(name:)
    @museums << Museum.new({name: name})
  end

  def find_artist(place)
    @artists[place - 1]
  end

  def find_museum(place)
    @museums[place - 1]
  end

  def find_museum_by(photograph)
    find_museum(photograph.museum_id)
  end

  def find_artist_by(photograph)
    find_artist(photograph.artist_id)
  end
end
