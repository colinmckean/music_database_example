require 'pg'
require_relative '../db/SqlRunner'

class Artist

  attr_accessor :id, :name
  def initialize(options)
    @id = options['id']
    @name = options['name']
  end
  def save()
    sql = "INSERT INTO artists(name) VALUES ('#{@name}')returning*;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)  }
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id='#{@id}';"
    artist = SqlRunner.run(sql)
    result = artist.map { |album| Album.new(album) } 
    return result
  end

  def update_artist
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end
  def delete_artist
    sql = "DELETE FROM artists WHERE id=#{@id}"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id_to_find)
    sql = "SELECT * FROM artists WHERE id='#{id_to_find}';"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end
end