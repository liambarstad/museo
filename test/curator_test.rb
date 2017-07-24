require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test
  def test_variables_initialize_empty
    curator = Curator.new
    assert curator.artists.empty?
    assert curator.museums.empty?
    assert curator.photographs.empty?
  end

  def test_add_artist
    curator = Curator.new
    curator.add_artist({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    assert_instance_of Artist, curator.artists[0]
  end

  def test_add_photgraph
    curator = Curator.new
    curator.add_photograph({name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})
    assert_instance_of Photograph, curator.photographs[0]
  end

  def test_add_museum
    curator = Curator.new
    curator.add_museum({name: "MoMA"})
    assert_instance_of Museum, curator.museums[0]
  end

  def test_find_artist_by_id
    curator = Curator.new
    curator.add_artist({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    assert_instance_of Artist, curator.find_artist(1)
  end

  def test_find_museum_by_id
    curator = Curator.new
    curator.add_museum({name: "MoMA"})
    assert_instance_of Museum, curator.find_museum(1)
  end

  def test_find_museum_by_photograph
    curator = Curator.new
    curator.add_museum({name: "Metropolitan Museum of Art"})
    curator.add_photograph({name: "Identical Twins, Roselle, New Jersey", artist_id: 1, museum_id: 1, year: 1967})
    assert_instance_of Museum, curator.find_museum_by(curator.photographs[0])
  end

  def test_find_artist_by_photograph
    curator = Curator.new
    curator.add_artist({name: "Diane Arbus", born: 1923, died: 1971, country: "United States"})
    curator.add_photograph({name: "Identical Twins, Roselle, New Jersey", artist_id: 1, museum_id: 1, year: 1967})
    assert_instance_of Artist, curator.find_artist_by(curator.photographs[0])
  end
end
